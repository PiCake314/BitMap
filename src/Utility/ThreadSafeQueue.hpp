#pragma once
#include <iostream>
#include <queue>
#include <mutex>
#include <condition_variable>
#include "../Structs/Renderables/Shapes/Shapes.hpp"

namespace map::util{

    // template <typename T>
    class ThreadSafeQueue{
    private:
        std::queue<renderables::RenderablePtr> queue;
        mutable std::mutex mutex;
        std::condition_variable cv;
        inline static int num_shapes = 0;


    public:

        ThreadSafeQueue() = default;

        ThreadSafeQueue(std::vector<renderables::RenderablePtr> &&items){
            for(auto& item : items){
                // item->depth = ++num_shapes;
                item->setDepth(++num_shapes);
                enqueue(std::move(item));
            }
        }

        ThreadSafeQueue(const ThreadSafeQueue&) = delete;

        ThreadSafeQueue& operator=(const ThreadSafeQueue&) = delete;

        ThreadSafeQueue(ThreadSafeQueue&& other) = delete;

        ThreadSafeQueue& operator=(ThreadSafeQueue&& other) = delete;

        ~ThreadSafeQueue() = default;

        void enqueue(renderables::RenderablePtr item) {
            std::lock_guard<std::mutex> lock{mutex};
            queue.push(std::move(item));
            cv.notify_one();
        }

        renderables::RenderablePtr dequeue() {
            std::unique_lock<std::mutex> lock{mutex};
            cv.wait(lock, [this] { return !queue.empty(); });
            auto frontItem = std::move(queue.front());
            queue.pop();
            return frontItem;
        }

        [[nodiscard]] bool isEmpty() const {
            std::lock_guard<std::mutex> lock{mutex};
            return queue.empty();
        }
    };

} // namespace map
