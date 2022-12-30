<?php
   
require APPPATH . 'libraries/REST_Controller.php';
     
class User extends REST_Controller {
    
	  /**
     * Get All Data from this method.
     *
     * @return Response
    */
    public function __construct() {
       parent::__construct();
       $this->load->database();
    }
       
    /**
     * Get All Data from this method.
     *
     * @return Response
    */
	public function index_get($id = 0)
	{
        if(!empty($id)){
            $data = $this->db->get_where("user", ['id' => $id])->row_array();
        }else{
            $data = $this->db->get("user")->result();
        }
     
        $this->response($data, REST_Controller::HTTP_OK);
	}
      
    /**
     * Get All Data from this method.
     *
     * @return Response
    */
    public function index_post()
    {
        $checkvalidation = $this->checkDuplicateUsername($this->input->post('username'));
        if($checkvalidation == true){
            $this->response(['Dublicate entery created successfully.'], REST_Controller::HTTP_OK);
        }else{
            $input = $this->input->post();
            $this->db->insert('user',$input);
            $this->response(['User created successfully.'], REST_Controller::HTTP_OK);
        }
        
    } 
     
    function checkDuplicateUsername($userName)
    {
        // print_r($userName);exit;
        $this->db->where('username',$userName);
        $query = $this->db->get('user');
        if ($query->num_rows() > 0){
            return true;
        }
        else{
            return false;
        }
    }

    /**
     * Get All Data from this method.
     *
     * @return Response
    */
    public function index_put($id)
    {
        $input = $this->put();
        $this->db->update('user', $input, array('id'=>$id));
     
        $this->response(['User updated successfully.'], REST_Controller::HTTP_OK);
    }
     
    /**
     * Get All Data from this method.
     *
     * @return Response
    */
    public function index_delete($id)
    {
        $this->db->delete('user', array('id'=>$id));
       
        $this->response(['User deleted successfully.'], REST_Controller::HTTP_OK);
    }
    	
}