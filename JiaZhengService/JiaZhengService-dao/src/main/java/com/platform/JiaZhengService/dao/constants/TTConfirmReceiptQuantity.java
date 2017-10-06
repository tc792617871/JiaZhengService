package com.platform.JiaZhengService.dao.constants;

/**
 * @ClassName: TTConfirmReceiptQuantity
* @Description: t_confirm_receipt_quantity表结构对应的常量类，定义字段名常量
* @author: peiyu
 */
public abstract class TTConfirmReceiptQuantity {
    /**
     * @Fields t_confirm_receipt_quantity.ID: 行序号
     */
    public static final String ID = "id";

    /**
     * @Fields t_confirm_receipt_quantity.SN: 商品编号
     */
    public static final String SN = "sn";

    /**
     * @Fields t_confirm_receipt_quantity.NAME: 商品名称
     */
    public static final String NAME = "name";

    /**
     * @Fields t_confirm_receipt_quantity.FULL_NAME:  商品全称
     */
    public static final String FULL_NAME = "full_name";

    /**
     * @Fields t_confirm_receipt_quantity.PRICE:  商品价格 
     */
    public static final String PRICE = "price";

    /**
     * @Fields t_confirm_receipt_quantity.CONFIRM_RECEIPT_QUANTITY: 单次已确认收货数量
     */
    public static final String CONFIRM_RECEIPT_QUANTITY = "confirm_receipt_quantity";

    /**
     * @Fields t_confirm_receipt_quantity.CONFIRM_RECEIPT_DATE: 确认收货时间
     */
    public static final String CONFIRM_RECEIPT_DATE = "confirm_receipt_date";

    /**
     * @Fields t_confirm_receipt_quantity.ORDERITEM: 
     */
    public static final String ORDERITEM = "orderItem";

    /**
     * @Fields t_confirm_receipt_quantity.CREATE_DATE: 创建时间
     */
    public static final String CREATE_DATE = "create_date";

    /**
     * @Fields t_confirm_receipt_quantity.MODIFY_DATE: 修改日期
     */
    public static final String MODIFY_DATE = "modify_date";
}