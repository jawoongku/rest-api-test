<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Members extends CI_Controller {

    var $inputData;
    var $outputData;
    var $code = 400;

    public function __construct()
    {
        parent::__construct();
        $this->load->model('MembersModel');
	    $this->load->library('mex');
    } // __construct


    public function _remap()
    {
        // METHOD
        $method = $_SERVER['REQUEST_METHOD'];

        if($method == 'GET')    $this->_membersRow();       // 회원정보 불러오기
        if($method == 'POST')   $this->_membersWrite();     // 정보 입력
        if($method == 'PUT')    $this->_membersUpdate();    // 정보 수정
        if($method == 'DELETE') $this->_membersDelete();    // 정보 삭제
    } // _remap


    private function _membersRow()
    {
        $this->inputData['idx'] = $this->uri->segment(2);

        if($this->inputData['idx'] == '') { // 회원정보 리스트

            //쿼리 스트링
            $query = $this->input->get('query');
            $output = json_decode($query, true);

            // 페이지
            if(isset($output['page']) == false || $output['page'] == '') {
                $output['page'] = 1;
            } else {
                $output['page'] = $output['page'] - 1;
            }
            if(isset($output['perpage']) == false || $output['perpage'] == '') $output['perpage'] = 10; // 항목 갯수

            $this->outputData['data'] = $this->MembersModel->membersList($output['page'], $output['perpage']);

        } else { // 회원정보
            $this->outputData['data'] = $this->MembersModel->membersRow($this->inputData['idx']);
        }

	    if(count($this->outputData['data']) > '0') {
            $this->code = 200;
        } else {
            $this->outputData['data'] = array();
            $this->code = 204;
        }

        $this->outputData['code'] = $this->code;
        $this->outputData['message'] = $this->_getStatusCodeMessage($this->outputData['code']);
        echo json_encode($this->outputData);
        
    } // _membersRow

    private function _membersWrite()
    {
        $this->load->library('form_validation');

        $this->form_validation->set_rules('email', 'email', 'required|valid_email|is_unique[members.email]');
        $this->form_validation->set_rules('password', 'Password', 'required');
        $this->form_validation->set_rules('password_re', 'password Confirmation', 'required|matches[password]');
        $this->form_validation->set_rules('name', 'name', 'required|min_length[4]|max_length[12]');
        $this->form_validation->set_rules('tel', 'tel', 'required|min_length[10]|max_length[16]');
        $this->form_validation->set_rules('rcmd_code', 'rcmd_code', 'min_length[5]|max_length[12]');

        if ($this->form_validation->run() == FALSE) {
            // 메세지 공백문자, 태그제거
            $tmpText = preg_replace('/\r\n|\r|\n/','',validation_errors());
            $tmpText = str_replace('<p>', '', $tmpText);

            $this->outputData['validationMessage'] = array_filter(explode('</p>', $tmpText));
            $this->outputData['code'] = ''; // 코드 넣어야 함

        } else {

            $this->inputData['email'] = $this->input->post('email');
            $this->inputData['password'] = $this->input->post('password');
            $this->inputData['name'] = $this->input->post('name');
            $this->inputData['tel']  = $this->input->post('tel');
            $this->inputData['rcmd_code']  = $this->input->post('rcmd_code');
            $this->inputData['marketing']  = ($this->input->post('marketing') == 'Y')?'Y':'N';

            $this->outputData['validationMessage'] = array('OK');

            $result = $this->MembersModel->membersWrite($this->inputData);

            if($result > 0) {
                $this->code = 200;
                $this->outputData['data']['idx'] = $result;
                $this->outputData['data']['email'] = $this->inputData['email'];
                $this->outputData['data']['name'] = $this->inputData['name'];
                $this->outputData['data']['tel'] = $this->inputData['tel'];
                $this->outputData['data']['rcmd_code'] = $this->inputData['rcmd_code'];
                $this->outputData['data']['marketing'] = $this->inputData['marketing'];

            } else {
                $this->code = 404;
                $this->outputData['data'] = array();
            }

        }

        $this->outputData['code'] = $this->code;
        $this->outputData['message'] = $this->_getStatusCodeMessage($this->outputData['code']);
        echo json_encode($this->outputData);
    } // _membersWrite

    private function _membersUpdate()
    {
        $this->load->library('form_validation');

        $this->inputData['idx'] = $this->uri->segment(2);
        $row = $this->MembersModel->membersRow($this->inputData['idx']);

        if(isset($row['idx']) == false) { // idx 없을때
            $this->code = 302;
            $this->outputData['data'] = array();
        } else {
            $this->inputData['password'] = $this->mex->put('password');
            $this->inputData['password_re'] = $this->mex->put('password_re');
            $this->inputData['marketing'] = ($this->mex->put('marketing') == 'Y')?'Y':'N';
            $this->form_validation->set_data($this->inputData);
            $this->form_validation->set_rules('password', 'Password', 'required');
            $this->form_validation->set_rules('password_re', 'password Confirmation', 'required|matches[password]');


            if ($this->form_validation->run() == FALSE) {
                // 메세지 공백문자, 태그제거
                $tmpText = preg_replace('/\r\n|\r|\n/','',validation_errors());
                $tmpText = str_replace('<p>', '', $tmpText);

                $this->outputData['validationMessage'] = array_filter(explode('</p>', $tmpText));
                $this->outputData['code'] = ''; // 코드 넣어야 함

            } else {

                $this->outputData['validationMessage'] = array('OK');

                $result = $this->MembersModel->membersUpdate($this->inputData);

                if($result > 0) {
                    $this->code = 200;
                } else {
                    $this->code = 404;
                    $this->outputData['data'] = array();
                }
            }
        }

        $this->outputData['code'] = $this->code;
        $this->outputData['message'] = $this->_getStatusCodeMessage($this->outputData['code']);
        echo json_encode($this->outputData);
    } // _membersUpdate


    private function _membersDelete()
    {
        $this->inputData['idx'] = $this->uri->segment(2);
        $row = $this->MembersModel->membersRow($this->inputData['idx']);

        if(isset($row['idx']) == false) { // idx 없을때
            $this->code = 302;
        } else {
            $result = $this->MembersModel->membersDel($this->inputData['idx']);

            if($result == true) {
                $this->code = 200;
            } else {
                $this->code = 404;
            }
        }

        $this->outputData['code'] = $this->code;
        $this->outputData['message'] = $this->_getStatusCodeMessage($this->outputData['code']);
        echo json_encode($this->outputData);
    } // _membersDelete


    // 상태 코드
    private function _getStatusCodeMessage($status)
    {
        $codes = Array(  
            100 => 'Continue',  
            101 => 'Switching Protocols',  
            200 => 'OK',  
            201 => 'Created',  
            202 => 'Accepted',  
            203 => 'Non-Authoritative Information',  
            204 => 'No Content',  
            205 => 'Reset Content',  
            206 => 'Partial Content',  
            300 => 'Multiple Choices',  
            301 => 'Moved Permanently',  
            302 => 'Found',  
            303 => 'See Other',  
            304 => 'Not Modified',  
            305 => 'Use Proxy',  
            306 => '(Unused)',  
            307 => 'Temporary Redirect',  
            400 => 'Bad Request',  
            401 => 'Unauthorized',  
            402 => 'Payment Required',  
            403 => 'Forbidden',  
            404 => 'Not Found',  
            405 => 'Method Not Allowed',  
            406 => 'Not Acceptable',  
            407 => 'Proxy Authentication Required',  
            408 => 'Request Timeout',  
            409 => 'Conflict',  
            410 => 'Gone',  
            411 => 'Length Required',  
            412 => 'Precondition Failed',  
            413 => 'Request Entity Too Large',  
            414 => 'Request-URI Too Long',  
            415 => 'Unsupported Media Type',  
            416 => 'Requested Range Not Satisfiable',  
            417 => 'Expectation Failed',  
            500 => 'Internal Server Error',  
            501 => 'Not Implemented',  
            502 => 'Bad Gateway',  
            503 => 'Service Unavailable',  
            504 => 'Gateway Timeout',  
            505 => 'HTTP Version Not Supported'  
        );  
  
        return (isset($codes[$status])) ? $codes[$status] : '';  
    }  // _getStatusCodeMessage
}

