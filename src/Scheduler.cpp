#include "../h/Scheduler.hpp"
#include "../test/printing.hpp"
Scheduler::node* Scheduler::head = nullptr;

Scheduler::node* Scheduler::tail = nullptr;

int Scheduler::put(KernelThread * k) {

    size_t size = sizeof(Scheduler::node);

    if(!head){
        head =(Scheduler::node*)Cache::allocSmallBuff(size);
        head->next = nullptr;
        head->info =k;
        tail = head;
    }
    else{
        Scheduler::node* tr;
        tr = (Scheduler::node*)Cache::allocSmallBuff(size);
        if(!tr)return -1;
        tr->next = nullptr;
        tr->info = k;
        tail->next=tr;
        tail = tail->next;
    }
    return 0;
}

KernelThread *Scheduler::get() {
    if (!head)return KernelThread::idleThread;
    Scheduler::node *tr = head;
    head = head->next;
    if(!head)tail=nullptr;
    KernelThread*ret = tr->info;
    Cache::deallocSmallBuff((void*)tr);
    return ret;
}

bool Scheduler::empty() {
    if(head==nullptr)return true;
    else return false;
}
