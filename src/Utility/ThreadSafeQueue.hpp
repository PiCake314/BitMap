#pragma once
#include <iostream>
#include <queue>
#include <mutex>
#include <condition_variable>

namespace map::util{

    template <typename T>
    class ThreadSafeQueue{
    private:
        std::queue<T> queue;
        mutable std::mutex mutex;
        std::condition_variable cv;
        inline static int num_shapes = 0;


    public:

        ThreadSafeQueue() = default;

        ThreadSafeQueue(const std::vector<T>& items){
            for(auto& item : items){
                item->depth = ++num_shapes;
                enqueue(item);
            }
        }

        ThreadSafeQueue(const ThreadSafeQueue&) = delete;

        ThreadSafeQueue& operator=(const ThreadSafeQueue&) = delete;

        ThreadSafeQueue(ThreadSafeQueue&& other) = delete;

        ThreadSafeQueue& operator=(ThreadSafeQueue&& other) = delete;

        ~ThreadSafeQueue() = default;

        void enqueue(const T& item) {
            std::lock_guard<std::mutex> lock{mutex};
            queue.push(item);
            cv.notify_one();
        }

        T dequeue() {
            std::unique_lock<std::mutex> lock{mutex};
            cv.wait(lock, [this] { return !queue.empty(); });
            T frontItem = queue.front();
            queue.pop();
            return frontItem;
        }

        bool isEmpty() const {
            std::lock_guard<std::mutex> lock{mutex};
            return queue.empty();
        }
    };

} // namespace map