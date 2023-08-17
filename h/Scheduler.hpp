//
// Created by os on 6/19/22.
//

#ifndef PROJECT_BASE_SCHEDULER_HPP
#define PROJECT_BASE_SCHEDULER_HPP


#include "../h/MemoryAllocator.hpp"
class KernelThread;


class Scheduler{

private:
    typedef struct node{
        struct node* next;
        KernelThread* info;
    }node;

    static node* head;
    static node* tail;
public:
    static int put(KernelThread* k) ;
    static KernelThread* get();
    static bool empty();

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


#endif //PROJECT_BASE_SCHEDULER_HPP
