//
// Created by os on 6/24/22.
//


#include "../h/Timer.hpp"
#include "../test/printing.hpp"

#include "../lib/console.h"
Timer::node* Timer::head = nullptr;

int Timer:: addInList(KernelThread *k, uint64 t) {
    if(t==0)return -1;
    node* temp;
    size_t size = sizeof(Timer::node);


    temp = (node*)Cache::allocSmallBuff(size);
    if(!temp)return -1;
    temp->next= nullptr;
    temp->timeSliceCounter=t;
    temp->info = k;
    if(head==nullptr){
        head = temp;
    }
    else{
        node*tr = head;
        while(true){
            if(tr->next==nullptr){
                break;
            }
            else{
                tr = tr->next;
            }
        }
        tr->next = temp;
    }
  /*  printString("Scheduler ima: ");
    printInt(Scheduler::len());
    printString("\nTimer ima: ");
    printInt(len());
    printString("\n");*/
    return 0;
}


void Timer::updateAll() {
    /*printString("Scheduler ima: ");
    printInt(Scheduler::len());
    printString("\nTimer ima: ");
    printInt(len());
    printString("\n");*/
    //if(head==nullptr){__putc('4');__putc('\n');}
    if(head == nullptr){checkAll();return;}
    node* temp = head;
   // if(head->next==nullptr)__putc('5');
    //else if(head->next->next ==nullptr)__putc('6');
    //else {
    //    __putc('w');
    //    __putc('t');
    //    __putc('f');
    //}
    //__putc('\n');
    while(true){
        if(temp == nullptr){
            break;
        }
        else{

          //  printInt(temp->timeSliceCounter);
          // printString("\n");
            temp->timeSliceCounter--;
            if(temp->timeSliceCounter==0){Scheduler::put(temp->info);}
            temp = temp->next;
        }
    }
    checkAll();
}

void Timer::checkAll() {
    node*tr = head;
    while(true){

        if(tr==nullptr)break;
        else{
            if(tr->timeSliceCounter==0){
                if(tr == head){
                    head = head->next;
                    node* temp =tr;
                    tr = tr->next;
                    Cache::deallocSmallBuff(temp);
                }
                else{
                    node* temp = head;
                    while(true){
                        if(temp->next==tr)break;
                        else temp = temp->next;
                    }
                    temp->next = tr->next;
                    temp = tr;
                    tr = tr->next;
                    Cache::deallocSmallBuff(temp);
                }
            }
            else{
                tr = tr->next;
            }
        }
    }
   // if(head==nullptr)__putc('7');
    //else if(head->next==nullptr)__putc('8');
    //else if(head->next->next ==nullptr)__putc('9');
    /*
    printString("-----\nizbacivanje\nScheduler ima: ");
    printInt(Scheduler::len());
    printString("\nTimer ima: ");
    printInt(len());
    printString("\n");*/
}
