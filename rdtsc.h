//-*-c++-*-
#ifndef _rtdsc_h_
#define _rtdsc_h_

//
// Inline function to read the CPU clock
//
inline
unsigned long long int rdtscll(void)
{
   unsigned a, d;

   __asm__ volatile("rdtsc" : "=a" (a), "=d" (d));

   return ((unsigned long long)a) | (((unsigned long long)d) << 32);;
}

#endif
