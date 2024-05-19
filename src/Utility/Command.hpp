#include <string>
#include <vector>
#include <cassert>
#include <sstream>
#include <utility>


namespace map::util{

    // function taken from SO: https://stackoverflow.com/questions/16605967/
    template <typename T>
    std::string to_string_d(const T &value, const int n = 6){
        std::ostringstream out;
        out.precision(n);
        out << value;
        return std::move(out).str();
    }

    class Command{

        std::string m_Command;
        bool m_Is_there_output;
        bool m_In_filter;
        int m_Current_input;
        bool m_First_filter;
        bool m_Applied_option;
        bool m_Done_filter;
        bool m_Mixed_audio;

        std::vector<std::pair<std::string, bool>> m_Inputs;
        std::string m_Output;

    public:

        Command():
        m_Command{"ffmpeg"},
        m_Is_there_output{false},
        m_In_filter{false},
        m_Current_input{0},
        m_First_filter{true},
        m_Applied_option{false},
        m_Done_filter{false},
        m_Mixed_audio{false}
        {};

        Command &addInput(const std::string& input){
            m_Command += " -i " + input;
            m_Inputs.push_back({input, false});

            return *this;
        }

        Command &addOutput(const std::string& output){
            m_Output = output;
            m_Is_there_output = true;
            return *this;
        }

        Command &startFilter(){
            assert(not m_In_filter);
            assert(not m_Done_filter);

            m_Command += " \n-filter_complex \"\n";
            m_In_filter = true;
            return *this;
        }

        Command &endFilter(){
            assert(m_In_filter);

            if(m_Inputs.size() == 2){
                m_Command += "[audio_out]";
                m_Mixed_audio = true;
            }

            m_Command += "\n\"\n";

            if(m_Mixed_audio){
                m_Command += "-map 0:v -map \"[audio_out]\"\n";
            }


            m_In_filter = false;
            m_Done_filter = true;

            return *this;
        }

        Command &pickInput(const int input){
            assert(m_In_filter && "Not in filter");
            assert(input > 0 and input < m_Inputs.size() && "Invalid input");
            assert(not m_Mixed_audio && "Audio has already been mixed");
            assert(not m_Inputs[input].second && "Cannot apply filter to the same input twice");

            if(not m_First_filter){
                assert(m_Applied_option);

                m_Command += "[a" + std::to_string(m_Current_input) + "];\n";

                // m_Command += ";\n";
            }

            m_Current_input = input;
            m_Command += '[' + std::to_string(m_Current_input) + ":a]";

            m_Applied_option = false;
            m_First_filter = false;
            m_Inputs[input].second = true;

            return *this;
        }

        Command &addDelay(const int delay){
            assert(m_In_filter && "Not in filter");

            if(m_Applied_option){
                m_Command += ", ";
            }

            m_Command += "adelay=" + std::to_string(delay) + "|" + std::to_string(delay);
            m_Applied_option = true;

            return *this;
        }

        Command &addVolume(const double volume){
            assert(m_In_filter && "Not in filter");

            if(m_Applied_option){
                m_Command += ", ";
            }

            m_Command += "volume=" + to_string_d(volume);
            m_Applied_option = true;

            return *this;
        }

        Command &addSpeed(const double speed){
            assert(m_In_filter && "Not in filter");

            if(m_Applied_option){
                m_Command += ", ";
            }

            m_Command += "atempo=" + to_string_d(speed);
            m_Applied_option = true;

            return *this;
        }

        Command &addLoop(){
            assert(m_In_filter && "Not in filter");

            if(m_Applied_option){
                m_Command += ", ";
            }

            m_Command += "aloop=loop=-1:size=1000";
            m_Applied_option = true;

            return *this;
        }

        Command &mixAudios(){
            assert(m_In_filter && "Not in filter");
            assert(m_Inputs.size() > 2 && "Cannot mix audios with less than 2 audio inputs");

            if(not m_First_filter){
                assert(m_Applied_option);
                if(m_Current_input != 0){
                    m_Command += "[a" + std::to_string(m_Current_input) + "]";
                }

                m_Command += ";\n";
            }

            for(int i = 1; i < m_Inputs.size(); i++){
                if(not m_Inputs[i].second){
                    m_Command += '[' + std::to_string(i) + ":a]anull[a" + std::to_string(i) + "];\n";
                }
            }


            for(int i = 1; i < m_Inputs.size(); i++){
                m_Command += "[a" + std::to_string(i) + "]";
            }

            m_Command += "amix=inputs=" + std::to_string(m_Inputs.size() -1) + ":duration=longest[audio_out]";
            m_Mixed_audio = true;

            return *this;
        }

        [[nodiscard]] std::string getCommand() const {
            assert(m_Is_there_output);
            assert(m_Done_filter and not m_In_filter);
            assert(m_Inputs.size() <= 2 or m_Mixed_audio);

            return m_Command + " -c:v copy " + m_Output;
        }

    };
}
