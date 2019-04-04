<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MembersModel extends CI_Model {

    public function __construct()
    {
        parent::__construct();
    }

    public function membersList($page, $perPage) {

        $firstPage = $page * $perPage;
        $query = $this->db->query('SELECT * FROM members WHERE 1 ORDER BY idx ASC  LIMIT '.$firstPage.', '.$perPage);
        $data = $query->result_array();
        
        return $data;
    }

    public function membersRow($idx) {
        $query = $this->db->query('SELECT * FROM members WHERE idx = "'.$idx.'" ');
        $data = $query->row_array();
        return $data;
    }


    public function membersWrite($inputData)
    {
        $data = array(
            'email' => $inputData['email'],
            'password' => $inputData['password'],
            'name' => $inputData['name'],
            'tel' => $inputData['tel'],
            'rcmd_code' => $inputData['rcmd_code'],
            'marketing' => $inputData['marketing']
        );
        $result = $this->db->insert('members', $data);
        if($result == true) {
            return $this->db->insert_id();
        } else {
            return 0;
        }

    }

    public function membersUpdate($inputData)
    {
        $data = array(
            'password' => $inputData['password'],
            'marketing' => $inputData['marketing']
        );

        $where = "idx = ".$inputData['idx'];
        $str = $this->db->update_string('members', $data, $where);
        $result = $this->db->query($str);

        return $result;
    }

    public function membersDel($idx)
    {
        $this->db->where('idx', $idx);
        $result = $this->db->delete('members');
        return $result;
    }


    // 테스트 데이터 삽입
    public function test()
    {
        $tmp = array('Y','N');
        for($i=0; $i<100; $i++) {
            $data = array(
                'email' => $i.'@email.com',
                'password' => $i.'password',
                'name' => $i.'name',
                'tel' => $i.'123123123',
                'rcmd_code' => $i.'rcmd_code',
                'marketing' => $tmp[rand(0, 1)]
            );
            $this->db->insert('members', $data);
        }
        return 1;
    }
}

