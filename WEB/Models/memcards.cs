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
    
    public partial class MemCards
    {
        public int MC_ID { get; set; }
        public Nullable<int> CL_ID { get; set; }
        public Nullable<int> S_ID { get; set; }
        public string MC_CardID { get; set; }
        public string MC_Password { get; set; }
        public string MC_Name { get; set; }
        public Nullable<int> MC_Sex { get; set; }
        public string MC_Mobile { get; set; }
        public string MC_Photo { get; set; }
        public Nullable<int> MC_Birthday_Month { get; set; }
        public Nullable<int> MC_Birthday_Day { get; set; }
        public Nullable<byte> MC_BirthdayType { get; set; }
        public Nullable<bool> MC_IsPast { get; set; }
        public Nullable<System.DateTime> MC_PastTime { get; set; }
        public Nullable<int> MC_Point { get; set; }
        public Nullable<float> MC_Money { get; set; }
        public Nullable<float> MC_TotalMoney { get; set; }
        public Nullable<int> MC_TotalCount { get; set; }
        public Nullable<int> MC_OverCount { get; set; }
        public Nullable<int> MC_State { get; set; }
        public Nullable<bool> MC_IsPointAuto { get; set; }
        public Nullable<int> MC_RefererID { get; set; }
        public string MC_RefererCard { get; set; }
        public string MC_RefererName { get; set; }
        public Nullable<System.DateTime> MC_CreateTime { get; set; }
    
        public virtual CardLevels CardLevels { get; set; }
        public virtual Shops Shops { get; set; }
    }
}
