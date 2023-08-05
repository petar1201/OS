#include "../h/syscall_c.hpp"
#include "../h/BuddyAllocator.hpp"
#include "../test/userMain.hpp"

extern "C" void supervisorTrap();

void main(){
    MemoryAllocator::init();
    __asm__ volatile ("csrw stvec, %0" : :"r"(&supervisorTrap));

    thread_t mainThread;
    thread_create(&mainThread, nullptr, nullptr);
    KernelThread::running = mainThread;
    KernelThread::initIdle();
    KernelThread::initPut();
    KernelBuffer::createBuff();



    changeToUserMode();

   // userMain();


    BuddyAllocator::init((void*)HEAP_START_ADDR, ((char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR)/8 );
    BuddyAllocator::printEntrys();
    printString("\n");

    struct test{
        long long a;
        long long b;
        long long c;
        long long d;
        long long e;
        long*niz[100];
        test*niz1[500];
        test*niz2[500];
        test*niz3[500];
        test*niz4[500];
        test*niz5[500];
        test*niz6[500];
    };
    struct test*y[5];
    int*x[100];
    for(int i = 0; i < 100; i++){
        x[i] = (int*)BuddyAllocator::buddy_alloc(sizeof(int));
    }
    for(int i = 0; i < 5; i++) {
        y[i] =(test*) BuddyAllocator::buddy_alloc(sizeof(test));
    }



    for(int i = 0; i < 5; i++) {
        BuddyAllocator::buddy_free(y[i]);
    }
    for(int i = 0; i < 100; i++){
        BuddyAllocator::buddy_free(x[i]);

    }

    BuddyAllocator::printEntrys();
    printString("\n");


        while(KernelBuffer::ulaz->getCnt()>0 || KernelBuffer::izlaz->getCnt()>0){
                while(KernelBuffer::ulaz->getCnt()>0)getc();
    }
}