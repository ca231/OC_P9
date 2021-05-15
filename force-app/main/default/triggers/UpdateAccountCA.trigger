trigger UpdateAccountCA on Order (after update,after delete, after undelete){   
    
    Set<Id> accIdList = new Set<Id>();
	Set<id> orderIds = new set<id>();
    
    if(Trigger.isInsert || Trigger.isUndelete|| Trigger.isUpdate){
        for(Order o : Trigger.new){
            orderIds.add(o.Id);
        }
    }

    if(Trigger.isDelete){
        for(Order o : Trigger.old){
            orderIds.add(o.Id);      
        }
    }
	OrderService.updateChiffreAffairesAccount(orderIds);
}