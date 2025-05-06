using System;
using System.Collections.Generic;

namespace DemoTry.Model;

public partial class ProductType
{
    public int TypeId { get; set; }

    public string Name { get; set; } = null!;

    public decimal TypeCoefficient { get; set; }

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
