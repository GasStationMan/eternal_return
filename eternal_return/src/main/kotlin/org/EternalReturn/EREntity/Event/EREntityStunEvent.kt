package org.EternalReturn.EREntity.Event

class EREntityStunEvent(var duration: Long) : EREntityEvent {
    val startStunMillies = System.currentTimeMillis();
}
