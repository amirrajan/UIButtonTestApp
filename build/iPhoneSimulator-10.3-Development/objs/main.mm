#import <UIKit/UIKit.h>

extern "C" {
    void rb_exit(int);
    void RubyMotionInit(int argc, char **argv);
void MREP_AB3F87B31EC54C91B8208F4487274F4D(void *, void *);
void MREP_18890DA6978E4C77926005AD93EE4C44(void *, void *);
void MREP_D90585AE31764AF3A3FA8485C53F0071(void *, void *);
}
@interface SpecLauncher : NSObject
@end

#include <dlfcn.h>

@implementation SpecLauncher

+ (id)launcher
{
    [UIApplication sharedApplication];

    // Enable simulator accessibility.
    dlopen("/Developer/Library/PrivateFrameworks/UIAutomation.framework/UIAutomation", RTLD_LOCAL);
    void (*AXSApplicationAccessibilitySetEnabled)(int);
    *(void **)(&AXSApplicationAccessibilitySetEnabled) = dlsym(RTLD_DEFAULT, "_AXSApplicationAccessibilitySetEnabled");
    if (AXSApplicationAccessibilitySetEnabled != NULL) {
      (*AXSApplicationAccessibilitySetEnabled)(1);
    }

    SpecLauncher *launcher = [[self alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:launcher selector:@selector(appLaunched:) name:UIApplicationDidBecomeActiveNotification object:nil];
    return launcher;
}

- (void)appLaunched:(id)notification
{
    // unregister observer to avoid duplicate invocation
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
    // Give a bit of time for the simulator to attach...
    [self performSelector:@selector(runSpecs) withObject:nil afterDelay:0.3];
}

- (void)runSpecs
{
MREP_AB3F87B31EC54C91B8208F4487274F4D(self, 0);
MREP_18890DA6978E4C77926005AD93EE4C44(self, 0);
MREP_D90585AE31764AF3A3FA8485C53F0071(self, 0);
[NSClassFromString(@"Bacon") performSelector:@selector(run) withObject:nil];
}

@end
int
main(int argc, char **argv)
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int retval = 0;
    setenv("VM_OPT_LEVEL", "0", true);
[SpecLauncher launcher];
    RubyMotionInit(argc, argv);
    retval = UIApplicationMain(argc, argv, nil, @"AppDelegate");
    rb_exit(retval);
    [pool release];
    return retval;
}
