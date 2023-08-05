//
// Created by os on 6/23/22.
//
#include "../h/KernelSemaphore.hpp"

void KernelSemaphore::block() {
    put(KernelThread::running);
    KernelThread::dispatchNoScheduler();
    /*KernelThread::pushRegisters();
    KernelThread* old = KernelThread::running;
    KernelThread::running = Scheduler::get();
    KernelThread::contextSwitch(&old->context, &KernelThread::running->context);
    KernelThread::popRegisters();*/
    //KernelThread::yield();
}

void KernelSemaphore::unblock() {
    KernelThread*t = get();
    if(t)Scheduler::put(t);
}

int KernelSemaphore::wait() {
    if(--val<0)block();
    if(KernelThread::running->retVal==-1){
        KernelThread::running->retVal=0;
        return -1;
    }
    return 0;
}

int KernelSemaphore::signal() {
    if (++val <= 0)unblock();
    return 0;
}

int KernelSemaphore::destroy(KernelSemaphore*p) {
    KernelSemaphore::node* tr = p->head;
    int vrati = 0;
    while(true){
        if(tr == nullptr) break;
        else{
            Scheduler::put(tr->info);
            tr->info->retVal=-1;
            KernelSemaphore::node* temp = tr;
            tr = tr->next;
            int r = MemoryAllocator::free(temp);
            if(r != 0) vrati = -1;
        }
    }
    int r = MemoryAllocator::free(p);
    if(r!=0)vrati = -1;
    return vrati;
}

int KernelSemaphore::createSemaphore(KernelSemaphore **handle, int startVal) {
    size_t size = sizeof(KernelSemaphore);
    size_t sz = MemoryAllocator::roundToNumOfBlocks(size);

    KernelSemaphore*tr;
    tr = (KernelSemaphore*)MemoryAllocator::malloc(sz);
    if(!tr)return -1;
    tr->head=nullptr;
    tr->tail=nullptr;
    tr->val=startVal;
    *handle=tr;
    return 0;
}

KernelThread *KernelSemaphore::get() {
    if (!head)return nullptr;
    node *tr = head;
    head = head->next;
    if(!head)tail=nullptr;
    KernelThread*ret = tr->info;
    MemoryAllocator::free((void*)tr);
    return ret;
}

void KernelSemaphore::put(KernelThread* k) {
    size_t size = sizeof(node);
    size_t sz = MemoryAllocator::roundToNumOfBlocks(size);

    if(!head){
        head =(node*)MemoryAllocator::malloc(sz);
        head->next = nullptr;
        head->info =k;
        tail = head;
    }
    else{
        node* tr;
        tr = (node*)MemoryAllocator::malloc(sz);
        tr->next = nullptr;
        tr->info = k;
        tail->next=tr;
        tail = tail->next;
    }
}
