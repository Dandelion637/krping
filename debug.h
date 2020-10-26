#ifndef __DEBUG__H
#define __DEBUH__H

#define PFX "krping: "

// #define DEBUG
#ifdef DEBUG
    #define DEBUG_LOG(format, ...) printk(PFX "[%s:%d]: " format, __func__, __LINE__, ##__VA_ARGS__)
#else
    #define DEBUG_LOG(format, ...)
#endif

#endif