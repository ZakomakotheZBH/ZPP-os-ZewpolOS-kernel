<!DOCTYPE ZewML package "nodejsosserver" version="1.0">

<php>
    $server_running = false;
    $port = 8080;
    $cpu_load = 0;
    
    function start_server($config) {
        global $server_running, $port, $cpu_load;
        $port = $config['port'] ?? 8080;
        $server_running = true;
        $cpu_load = 0;
        return true;
    }
    
    function get_status() {
        global $server_running, $port, $cpu_load;
        return json_encode([
            'running' => $server_running,
            'port' => $port,
            'cpu_load' => $cpu_load
        ]);
    }
</php>

<zewml>
    <functions>
        <fun name="start">
            <arg name="config" type="str"/>
            <return type="bool">
                <?= start_server(json_decode($config, true)) ?>
            </return>
        </fun>
        
        <fun name="status">
            <return type="str">
                <?= get_status() ?>
            </return>
        </fun>
        
        <fun name="available">
            <return type="bool">true</return>
        </fun>
        
        <fun name="cpu">
            <fun name="load">
                <return type="int"><?= rand(0, 100) ?></return>
            </fun>
        </fun>
        
        <fun name="idle">
            <asm>hlt</asm>
        </fun>
    </functions>
</zewml>
