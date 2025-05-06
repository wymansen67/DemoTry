using System;
using System.Collections.Generic;

namespace DemoTry.Model;

public partial class Product
{
    public int Articul { get; set; }

    public int Type { get; set; }

    public string Name { get; set; } = null!;

    public decimal MinimalPriceForPartner { get; set; }

    public virtual ProductType TypeNavigation { get; set; } = null!;
}
