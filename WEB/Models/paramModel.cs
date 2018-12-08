using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEB.Models
{
    public class paramModel<T>
    {
        public int status { get; set; }
        public string msg { get; set; }
        public List<T> data { get; set; }
    }
}