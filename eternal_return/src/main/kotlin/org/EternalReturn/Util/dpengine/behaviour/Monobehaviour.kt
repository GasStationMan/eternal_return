package org.EternalReturn.Util.dpengine.behaviour

import org.EternalReturn.Util.dpengine.DPEngine
import org.EternalReturn.Util.geometryModule.Geometry.GeometryCalculatable
import java.lang.reflect.ParameterizedType


/**
 * 대부분의 수정 사항은 MonobehaviourActor.registerMonobehaviour()에서 이루어짐.
 */
abstract class Monobehaviour<T : MonobehaviourEvent> protected constructor() : GeometryCalculatable() {
    open lateinit var eventType: Class<T>
    open lateinit var actor: MonobehaviourActor
    lateinit var dpEngine: DPEngine;
    var state: State = State.STOP
        private set

    val isRunning: Boolean
        get() = this.state == State.RUNNING

    /**
     * RUNNING : update가 실행되는 상태
     * STOP : update가 종료된 상태
     */
    enum class State {
        RUNNING,
        STOP
    }

    /**
     * MonobehaiourActor.registerMonobehaviour()의 인자로 넣기 위해서만 instantiate할 것.
     */
    init {
        __getGenericClass()
    }

    private fun __getGenericClass() {
        //Generic의 superClass를 얻어옴 (CharacterEvent)
        val superType = javaClass.getGenericSuperclass()

        //superType을 ParameterizedType으로 캐스팅하여 제네릭 정보를 얻어오기 위한 준비를 함.
        check(superType is ParameterizedType) { "Monobehaviour must be directly parameterized" }
        //바로 T에 대한 정보를 가져온다.
        this.eventType = superType.actualTypeArguments[0] as Class<T>
        //System.out.println(eventType);
    }


    fun dispatchEvent(event: MonobehaviourEvent) {
        check(eventType.isInstance(event)) { "Wrong event type: " + event.javaClass }
        startMonobehav(eventType.cast(event))
        this.state = State.RUNNING
    }

    fun startMonobehav(event: T) {
        dpEngine.geometryModule.setVecScope().use { scope ->
            start(event)
        }
    }

    fun updateMonobehav(eventList: MutableCollection<MonobehaviourEvent>) {
        dpEngine.geometryModule.setVecScope().use { scope ->
            update(eventList)
        }
    }

    abstract fun start(event: T)
    abstract fun update(eventList: MutableCollection<MonobehaviourEvent>)

    /**
     * MonobehaviourActor 내 스케줄러로 하여금 해당 Monobehaviour을 제거하도록 마킹합니다. <br></br>
     * 스케줄러에서 제거된 Monobehaviour은 update() 대상에서 제외됩니다. <br></br>
     * 다시 update()를 재개시키려면 해당 Monobehaviour에 맞는 MonobehaviourEvent를 해당 객체에 submit()해야 합니다.
     */
    fun stopMonobehav() {
        this.state = State.STOP
    }

    fun runMonobehav() {
        this.state = State.RUNNING
    }

    /**
     * 해당 Monobehaviour을 실행할 Actor을 적용함과 동시에 <br></br>
     * 해당 Monobehaviour에서 사용할 GeometryEngine을 적용하는 함수 <br></br>
     * (MonobehaviourActor 과 Monobehaviour은 같은 엔진을 공유하고 있어야 함)
     */
    fun setMonobehaviourActor(actor: MonobehaviourActor) {
        this.actor = actor
        this.dpEngine = actor.monobehaviourModule.dpEngine
        geometryCalculatableInit(dpEngine.geometryModule)
    }
}