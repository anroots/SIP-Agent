<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Dash extends Controller_Main
{

    public function action_index() {
		$this->title = __('SIP-Agent API');
    }

} 
