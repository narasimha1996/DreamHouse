trigger RestrictContactByName on Contact (before insert,before update) {

    RestrictContactByNameHandler.contactHandler(Trigger.new);

}