<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

$autoload['language'] = array('chat');
$autoload['driver'] = array('streams');
$autoload['model'] = array('chat_m', 'chat_message_m', 'chat_assign_m');

/* End of file autoload.php */