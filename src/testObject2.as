package {
import flash.events.Event;

[Bindable]
public class testObject2 {

    private var m_value1:Boolean;

    private var m_value2:Boolean;

    private var m_value3:Boolean;

    private static var m_instance:testObject2 = new testObject2();

    public function testObject2() {
        if (m_instance) {
            throw new Error("シングルトンのコンストラクタを呼んではああいけません！(深刻な素材不足)");
        }
    }

    public static function get instance():testObject2 {
        return m_instance;
    }

    public function get value1():Boolean {
        return m_value1;
    }

    public function set value1(value:Boolean):void {
        if (value) {
            trace("value1 <- true");
        } else {
            trace("value1 <- false");
        }
        m_value1 = value;
        dispatchEvent(new Event("v3changed"));
        dispatchEvent(new Event("v12changed"));
        dispatchEvent(new Event("v13changed"));
    }

    public function get value2():Boolean {
        return m_value2;
    }

    public function set value2(value:Boolean):void {
        if (value) {
            trace("value2 <- true");
        } else {
            trace("value2 <- false");
        }
        m_value2 = value;
        dispatchEvent(new Event("v3changed"));
        dispatchEvent(new Event("v12changed"));
        dispatchEvent(new Event("v23changed"));
    }

    [Bindable("v3changed")]
    public function get value3():Boolean {
        if (m_value1 && m_value2 && m_value3) {
            return true;
        }
        return false;
    }

    public function set value3(value:Boolean):void {
        if (value) {
            trace("value3 <- true");
        } else {
            trace("value3 <- false");
        }
        m_value3 = value;
        dispatchEvent(new Event("v13changed"));
        dispatchEvent(new Event("v23changed"));
    }

    [Bindable("v12changed")]
    public function get value12():Boolean {
        if (m_value1 && m_value2) {
            return true;
        }
        return false;
    }

    [Bindable("v13changed")]
    public function get value13():Boolean {
        if (m_value1 && m_value3) {
            return true;
        }
        return false;
    }

    [Bindable("v23changed")]
    public function get value23():Boolean {
        if (m_value2 && m_value3) {
            return true;
        }
        return false;
    }
}
}
