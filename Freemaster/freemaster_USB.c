#include "freemaster_USB.h"

usb_status USB_Class_CDC_Send_Data
(
    cdc_handle_t handle,
    uint8_t ep_num,
    uint8_t * app_buff,
    uint32_t size
)
{
#if CDC_IMPLEMENT_QUEUING
    uint8_t index;
    uint8_t producer, consumer;
//        usb_endpoints_t *usb_ep_data;
#endif

    cdc_device_struct_t * cdc_obj_ptr;
    usb_status status = USB_OK;
    cdc_obj_ptr = (cdc_device_struct_t *)handle;
    if (NULL == cdc_obj_ptr)
    {
        return USBERR_ERROR;
    }

#if CDC_IMPLEMENT_QUEUING
//        usb_ep_data = cdc_obj_ptr->usb_ep_data;

    /* map the endpoint num to the index of the endpoint structure */
    index = USB_Map_Ep_To_Struct_Index(cdc_obj_ptr, ep_num);

    producer = cdc_obj_ptr->ep[index].bin_producer;
    USB_Cdc_Ep_Mutex_Lock(cdc_obj_ptr, ep_num);
    consumer = cdc_obj_ptr->ep[index].bin_consumer;

    if((producer >= consumer? (producer - consumer): (0x100 + producer - consumer)) != (uint8_t)(CDC_MAX_QUEUE_ELEMS))
    {
        /* the bin is not full*/
        uint8_t queue_num = (uint8_t)(producer % CDC_MAX_QUEUE_ELEMS);

        /* put all send request parameters in the endpoint data structure*/
        cdc_obj_ptr->ep[index].queue[queue_num].channel = ep_num;
        cdc_obj_ptr->ep[index].queue[queue_num].app_data.data_ptr = app_buff;
        cdc_obj_ptr->ep[index].queue[queue_num].app_data.data_size = size;
        cdc_obj_ptr->ep[index].queue[queue_num].handle =
            cdc_obj_ptr->controller_handle;

        if(producer == consumer)
        {

#endif
            status = USB_Class_Send_Data(cdc_obj_ptr->class_handle,
                                         ep_num, app_buff,size);
#if CDC_IMPLEMENT_QUEUING
            if(USB_OK == status)
            {
                /* increment producer bin by 1*/
                cdc_obj_ptr->ep[index].bin_producer = ++producer;
            }
        }
        else
        {
            /* increment producer bin by 1*/
            cdc_obj_ptr->ep[index].bin_producer = ++producer;
        }
    }
    else /* bin is full */
    {
        status = USBERR_DEVICE_BUSY;
    }
    USB_Cdc_Ep_Mutex_Unlock(cdc_obj_ptr, ep_num);
#endif
    return status;
}

usb_status USB_Class_Send_Data
(
    class_handle_t handle, /*[IN]*/
    uint8_t ep_num, /* [IN] the Endpoint number */
    uint8_t * buff_ptr, /* [IN] buffer to send */
    uint32_t size /* [IN] length of the transfer */
)
{
    usb_status error = USB_OK;
    //uint16_t  state;
    usb_class_object_struct_t* class_object_ptr = (usb_class_object_struct_t*)handle;

    if (NULL == class_object_ptr)
    {
        return USBERR_ERROR;
    }

    error = usb_device_send_data(class_object_ptr->controller_handle,
    ep_num,buff_ptr,size);

    return error;
}
