public with sharing class OrderSelector {
    public static Order fetchOrder(Id orderId) {
        if (orderId == null) {
            return null;
        }
        return [SELECT OrderNumber, Account.PersonEmail FROM Order WHERE Id = :orderId];
    }
}
