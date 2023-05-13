trigger AccountDeletion on Account (before delete) {
    AccountDeletionHandler.accountHandler(trigger.old);
  
}