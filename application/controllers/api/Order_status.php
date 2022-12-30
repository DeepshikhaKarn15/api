<?php
   
require APPPATH . 'libraries/REST_Controller.php';
     
class Order_status extends REST_Controller {
    
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
            $data = $this->db->get_where("order_status", ['id' => $id])->row_array();
        }else{
            $data = $this->db->get("order_status")->result();
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
        $input = $this->input->post();
        $this->db->insert('order_status',$input);
        $this->response(['order created successfully.'], REST_Controller::HTTP_OK);
    } 
     



    /**
     * Get All Data from this method.
     *
     * @return Response
    */
    public function index_put($id)
    {
        $input = $this->put();
        // print_r($input);exit;
        // $data=[
        //     'order_id'=  $input = $this->put('order_id'),
        //     'order_id'=  $input = $this->put('user_id'),
        // ]
        $this->db->update('order_status', $input, array('id'=>$id));
    //  echo $this->db->last_query();exit;
        $this->response(['order updated successfully.'], REST_Controller::HTTP_OK);
    }
     
    /**
     * Get All Data from this method.
     *
     * @return Response
    */
    public function index_delete($id)
    {
        $this->db->delete('order_status', array('id'=>$id));
       
        $this->response(['order deleted successfully.'], REST_Controller::HTTP_OK);
    }
    	
}