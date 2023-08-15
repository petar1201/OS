#include "../h/syscall_c.hpp"
#include "../h/BuddyAllocator.hpp"
#include "../h/Cache.hpp"
#include "../test/userMain.hpp"

extern "C" void supervisorTrap();

void main(){
    MemoryAllocator::init();
    BuddyAllocator::init((void*)HEAP_START_ADDR, ((char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR)/8 );

    __asm__ volatile ("csrw stvec, %0" : :"r"(&supervisorTrap));
    thread_t mainThread;
    Cache::initBuffs();

    KernelThread::initCaches();


    thread_create(&mainThread, nullptr, nullptr);
    KernelThread::running = mainThread;
    KernelThread::initIdle();
    KernelThread::initPut();
    KernelBuffer::createBuff();

    changeToUserMode();

    userMain();

        while(KernelBuffer::ulaz->getCnt()>0 || KernelBuffer::izlaz->getCnt()>0){
                while(KernelBuffer::ulaz->getCnt()>0)getc();
    }
}