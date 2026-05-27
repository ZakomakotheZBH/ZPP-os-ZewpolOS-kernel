<!DOCTYPE ZewML package "data" version="1.0">

<php>
    $collected_data = [];
    
    function start_collection($tag) {
        global $collected_data;
        $collected_data[$tag] = [
            'started' => time(),
            'records' => []
        ];
        return $tag;
    }
    
    function record_data($tag, $field, $value) {
        global $collected_data;
        $collected_data[$tag]['records'][$field][] = $value;
    }
    
    function snapshot() {
        global $collected_data;
        return json_encode($collected_data);
    }
</php>

<zewml>
    <functions>
        <fun name="init_pc">
            <asm>
                call setup_data_buffer
                ret
            </asm>
        </fun>
        
        <fun name="start">
            <arg name="tag" type="str"/>
            <return type="str">
                <?= start_collection($tag) ?>
            </return>
        </fun>
        
        <fun name="record">
            <arg name="tag" type="str"/>
            <arg name="field" type="str"/>
            <arg name="value" type="str"/>
            <?php record_data($tag, $field, $value); ?>
        </fun>
        
        <fun name="snapshot">
            <return type="str">
                <?= snapshot() ?>
            </return>
        </fun>
        
        <fun name="available">
            <return type="bool">true</return>
        </fun>
    </functions>
</zewml>
