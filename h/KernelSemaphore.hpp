//
// Created by os on 6/22/22.
//

#ifndef PROJECT_BASE_KERNELSEMAPHORE_HPP
#define PROJECT_BASE_KERNELSEMAPHORE_HPP

#include "KernelThread.hpp"

class KernelSemaphore{
private:
    typedef struct node{
        KernelThread* info;
        node* next;
    }node;

    node* head;
    node* tail;
    int val;

    KernelThread* get();
    void put(KernelThread* k);

protected:
    void block();
    void unblock();

public:

    static int createSemaphore(KernelSemaphore**handle, int startVal);

    int wait();
    int signal();
    static int destroy(KernelSemaphore* p);

};


#endif //PROJECT_BASE_KERNELSEMAPHORE_HPP
