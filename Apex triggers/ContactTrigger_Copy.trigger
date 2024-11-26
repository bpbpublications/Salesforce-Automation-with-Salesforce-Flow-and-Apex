trigger ContactTrigger on Contact (after update) {
    // Prevent recursive calls
    if (!CheckRecursive.firstCall) {
        CheckRecursive.firstCall = true;
        // Call your Handler method here
    }
}
