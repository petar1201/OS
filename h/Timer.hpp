//
// Created by os on 6/24/22.
//

#ifndef PROJECT_BASE_TIMER_HPP
#define PROJECT_BASE_TIMER_HPP

#include "../lib/hw.h"
#include "Scheduler.hpp"
#include "MemoryAllocator.hpp"

class KernelThread;

class Timer{
private:
    typedef struct node{
        KernelThread*info;
        struct node* next;
        uint64 timeSliceCounter;
    }node;

    static node* head;
    static void checkAll();


public:
    static int addInList(KernelThread* k, uint64 t);
    static void updateAll();

    static int len(){
        node* temp=head;
        int cnt=0;
        while(true){
            if(!temp)return cnt;
            else{
                cnt++;
                temp=temp->next;
            }
        }
        return 0;
    }
};


#endif //PROJECT_BASE_TIMER_HPP
