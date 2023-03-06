#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "IAPerformanceCPU.h"
#import "IAPerformanceFPS.h"
#import "IAPerformanceLabel.h"
#import "IAPerformanceManager.h"
#import "IAPerformanceMemory.h"
#import "IAPerformanceWindow.h"

FOUNDATION_EXPORT double PerformanceToolVersionNumber;
FOUNDATION_EXPORT const unsigned char PerformanceToolVersionString[];

