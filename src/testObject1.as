package {

[Bindable]
public class testObject1 {

    private var m_value1:Boolean;

    private var m_value2:Boolean;

    private var m_value3:Boolean;

    private static var m_instance:testObject1 = new testObject1();

    public function testObject1() {
        if (m_instance) {
            throw new Error("シングルトンのコンストラクタを呼んではああいけません！(深刻な素材不足)");
        }
    }

    public static function get instance():testObject1 {
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
    }

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
    }

    public function get value12():Boolean {
        if (m_value1 && m_value2) {
            return true;
        }
        return false;
    }

    public function get value13():Boolean {
        if (m_value1 && m_value3) {
            return true;
        }
        return false;
    }

    public function get value23():Boolean {
        if (m_value2 && m_value3) {
            return true;
        }
        return false;
    }
}
}
