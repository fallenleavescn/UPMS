//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace WEB.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class consumeorders
    {
        public int CO_ID { get; set; }
        public Nullable<int> S_ID { get; set; }
        public Nullable<int> U_ID { get; set; }
        public string CO_OrderCode { get; set; }
        public Nullable<sbyte> CO_OrderType { get; set; }
        public Nullable<int> MC_ID { get; set; }
        public string MC_CardID { get; set; }
        public Nullable<int> EG_ID { get; set; }
        public Nullable<float> CO_TotalMoney { get; set; }
        public Nullable<float> CO_DiscountMoney { get; set; }
        public Nullable<int> CO_GavePoint { get; set; }
        public Nullable<float> CO_Recash { get; set; }
        public string CO_Remark { get; set; }
        public Nullable<System.DateTime> CO_CreateTime { get; set; }
    
        public virtual shops shops { get; set; }
        public virtual users users { get; set; }
    }
}