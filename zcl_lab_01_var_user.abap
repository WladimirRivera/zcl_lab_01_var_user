CLASS zcl_lab_01_var_user DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    CONSTANTS: mc_purchase_date TYPE d VALUE '20240823',
               mc_purchase_time TYPE t VALUE '055846',
               mc_price         TYPE f VALUE '10.5',
               mc_tax           TYPE i VALUE 16,
               mc_increase      TYPE decfloat16 VALUE '20.5',
               mc_discounts     TYPE decfloat34 VALUE '10.5',
               mc_type          TYPE c LENGTH 10 VALUE 'PC',
               mc_shipping      TYPE p LENGTH 8 DECIMALS 2 VALUE '40.36',
               mc_id_code       TYPE n LENGTH 4 VALUE '1110',
               mc_qr_code       TYPE x LENGTH 5 VALUE 'F5CF',
               mc_product       TYPE string VALUE 'Laptop',
               mc_bar_code      TYPE xstring VALUE '12121121211'.

    DATA: mv_purchase_date TYPE d,
          mv_purchase_time TYPE t,
          mv_price         TYPE f,
          mv_tax           TYPE i,
          mv_increase      TYPE decfloat16,
          mv_discounts     TYPE decfloat34,
          mv_type          TYPE c LENGTH 10,
          mv_shipping      TYPE p LENGTH 8 DECIMALS 2,
          mv_id_code       TYPE n LENGTH 4,
          mv_qr_code       TYPE x LENGTH 5,
          mv_product       TYPE string,
          mv_bar_code      TYPE xstring.

    TYPES: BEGIN OF mty_customer,
             id       TYPE i,
             customer TYPE char25,
             age      TYPE i,
           END OF mty_customer.

    DATA ms_employees TYPE snwd_employees.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_01_var_user IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    me->mv_purchase_date = me->mc_purchase_date.
    me->mv_purchase_time = me->mc_purchase_time.
    me->mv_price = me->mc_price.
    me->mv_tax = me->mc_tax.
    me->mv_increase = me->mc_increase.
    me->mv_discounts = me->mc_discounts.
    me->mv_product = me->mc_product.
    me->mv_bar_code = me->mc_bar_code.
    me->mv_type = me->mc_type.
    me->mv_shipping = me->mc_shipping.
    me->mv_id_code = me->mc_id_code.
    me->mv_qr_code = me->mc_qr_code.

*   Full type variables D and T
    out->write( |Purchase date: { me->mv_purchase_date+6(2) }/{ me->mv_purchase_date+4(2) }/{ me->mv_purchase_date+0(4) }| ).
    out->write( |Purchase time: { me->mv_purchase_time+0(2) }:{ me->mv_purchase_time+2(2) }:{ me->mv_purchase_time+4(2) }| ).

*   Full type variables number I and F
    out->write( |Price: { me->mv_price }| ).
    out->write( |Tax: { me->mv_tax }| ).

*   Variables of full type DECFLOAT
    out->write( |Increase: { me->mv_increase }| ).
    out->write( |Discounts: { me->mv_discounts }| ).

*   Variables of full type STRING and XSTRING
    out->write( |Product: { me->mv_product }| ).
    out->write( |Bar code: { me->mv_bar_code }| ).

*   Incomplete type variable C and P
    out->write( |Type: { me->mv_type }| ).
    out->write( |Shipping: { me->mv_shipping }| ).

*   Incomplete type variables N and X
    out->write( |ID code: { me->mv_id_code }| ).
    out->write( |QR code: { me->mv_qr_code }| ).

*   Variables using inline declaration
    DATA(lv_product) = me->mv_product.
    DATA(lv_bar_code) = me->mv_bar_code.
    out->write( |Product: { lv_product }| ).
    out->write( |Bar code: { lv_bar_code }| ).
  ENDMETHOD.
ENDCLASS.