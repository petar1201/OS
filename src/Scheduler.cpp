#include "../h/Scheduler.hpp"
#include "../test/printing.hpp"
Scheduler::node* Scheduler::head = nullptr;

Scheduler::node* Scheduler::tail = nullptr;

void Scheduler::put(KernelThread * k) {

    size_t size = sizeof(Scheduler::node);
    size_t sz = MemoryAllocator::roundToNumOfBlocks(size);

    if(!head){
        head =(Scheduler::node*)MemoryAllocator::malloc(sz);
        head->next = nullptr;
        head->info =k;
        tail = head;
    }
    else{
        Scheduler::node* tr;
        tr = (Scheduler::node*)MemoryAllocator::malloc(sz);
        tr->next = nullptr;
        tr->info = k;
        tail->next=tr;
        tail = tail->next;
    }
}

KernelThread *Scheduler::get() {
    if (!head)return KernelThread::idleThread;
    Scheduler::node *tr = head;
    head = head->next;
    if(!head)tail=nullptr;
    KernelThread*ret = tr->info;
    MemoryAllocator::free((void*)tr);
    return ret;
}

bool Scheduler::empty() {
    if(head==nullptr)return true;
    else return false;
}
