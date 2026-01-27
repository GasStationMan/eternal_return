package org.EternalReturn.Util.DPEngine.Behaviour

import org.EternalReturn.Util.DPEngine.DPEngine
import java.util.*

/**
 * Monobehaviour을 실행하기 위한 객체.
 *
 *
 * (MonobehaviourEvent, Monobehaviour)의 키 쌍을 유지한다.
 *
 *
 * 해당 객체로 이벤트가 전달되면, 전달된 이벤트들을 소비하여 정해진 Monobehaviour의 로직을 실행한다.
 *
 *
 * 해당 객체로 이벤트를 전달하고자 한다면
 *
 *
 * `MonobehaviourActor.submitEvent(MonobehaviourEvent)`
 *
 *
 * 메소드를 사용할 것.
 *
 *
 */
abstract class MonobehaviourActor protected constructor() {
    /**
     * (MonobehaviourEvent, Monobehaviour)의 키 쌍
     */
    protected var monobehaviourMap: HashMap<Class<out MonobehaviourEvent>, Monobehaviour<out MonobehaviourEvent>> =
        HashMap<Class<out MonobehaviourEvent>, Monobehaviour<out MonobehaviourEvent>>()

    /**
     * 제출된 엔티티를 담는 큐 ( LinkedList )
     */
    protected var submittedEvent: ArrayDeque<MonobehaviourEvent> = ArrayDeque<MonobehaviourEvent>()

    /**
     * update(MonobehaviourEvent)를 호출할 Monobehaviour들을 스케줄링하기 위해 유지하는 링크드 리스트
     */
    protected var runningBehaviours: ArrayDeque<Monobehaviour<out MonobehaviourEvent>> = ArrayDeque<Monobehaviour<out MonobehaviourEvent>>()

    protected lateinit var engine: DPEngine;


    /**
     * 외부에서 해당 객체에게 이벤트를 제출하기 위한 창구
     */
    fun submitEvent(event: MonobehaviourEvent) {
        //System.out.println("Event submitted " + event.getClass() + " | Length = " + submittedEvent.size());
        submittedEvent.add(event)
        engine.submitActorWhoTriggeredEvent(this)
    }

    /**
     * 제출된 이벤트 디큐에서 하나씩 빼면서 dispatch,
     * 해당 이벤트는 다시 checkedEvent 내에 삽입됨.
     */
    protected var checkedEvent: ArrayDeque<MonobehaviourEvent> = ArrayDeque<MonobehaviourEvent>()

    fun dispatchEvents() {
        while (!submittedEvent.isEmpty()) {
            val event = submittedEvent.removeFirst()
            val monobehav = monobehaviourMap.get(event.javaClass)
            //System.out.println(event.getClass());
            if (monobehav == null) {
                continue
            }
            runningBehaviours.add(monobehav)
            //System.out.println("dispatch success");
            monobehav.dispatchEvent(event)
            checkedEvent.addLast(event)
        }
    }

    /**
     * 해당 Actor의 Monobehaviour을 update()함.
     * 만약 한개의 Monobehaviour도 Running이 아니라면 false를 반환
     * 그 외에는 true를 반환
     */
    fun updateMonobehaviour(): Boolean {
        if (runningBehaviours.isEmpty()) {
            return false
        }

        //monobehaviour update() 스케줄링
        val monobehavNode = runningBehaviours.iterator()
        while (monobehavNode.hasNext()) {
            val monobehaviour: Monobehaviour<*> = monobehavNode.next()!!
            monobehaviour.updateMonobehav(checkedEvent)

            //System.out.println("run");
            if (!monobehaviour.isRunning()) {
                monobehavNode.remove()
                //System.out.println("removed : " + monobehaviour.getClass());
            }
        }
        checkedEvent.clear()
        return true
    }

    val isEmptyForRunningMonobehaviour: Boolean
        get() = runningBehaviours.isEmpty()

    /**
     * 해당 이벤트 클래스에 맞는 (MonobehaviourEvent, Monobehaviour) 쌍을 저장한다.
     * 또한 해당 Monobehaviour의 DPEngine객체 또한 저장한다.
     */
    protected fun registerMonobehaviour(monobehaviour: Monobehaviour<out MonobehaviourEvent>) {
        if (this.monobehaviourMap.get(monobehaviour.getEventType()) != null) {
            throw DuplicatedMonobehaviourRegisterException("Key " + monobehaviour.getEventType() + " is duplicated.")
        }
        this.monobehaviourMap.put(monobehaviour.getEventType(), monobehaviour)
        monobehaviour.setMonobehaviourActor(this)
        //System.out.println("register event " + monobehaviour.getClass());
    }

    /**
     * 해당 MonobehaviourActor을 관리할 DPEngine을 설정.
     */
    fun setDPEngine(engine: DPEngine) {
        this.engine = engine
        //System.out.println("DPEngine set");
    }
}