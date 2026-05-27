<!DOCTYPE ZewML package "randombin" version="1.0">

<php>
    function binary_to_text($binary) {
        $hex = str_replace(' ', '', $binary);
        $text = '';
        for ($i = 0; $i < strlen($hex); $i += 2) {
            $text .= chr(hexdec(substr($hex, $i, 2)));
        }
        return $text;
    }
    
    function random_bytes($size) {
        $bytes = '';
        for ($i = 0; $i < $size; $i++) {
            $bytes .= chr(rand(0, 255));
        }
        return bin2hex($bytes);
    }
</php>

<zewml>
    <functions>
        <fun name="convert">
            <arg name="binary" type="str"/>
            <return type="str">
                <?= binary_to_text($binary) ?>
            </return>
        </fun>
        
        <fun name="generate">
            <arg name="size" type="int"/>
            <return type="str">
                <?= random_bytes($size) ?>
            </return>
        </fun>
        
        <fun name="from_file">
            <arg name="path" type="str"/>
            <return type="str">
                <?= bin2hex(file_get_contents($path)) ?>
            </return>
        </fun>
    </functions>
</zewml>
