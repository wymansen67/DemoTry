using System;
using System.Collections.Generic;

namespace DemoTry.Model;

public partial class PartnerProduct
{
    public int Product { get; set; }

    public long Partner { get; set; }

    public int Quantity { get; set; }

    public DateOnly SellDate { get; set; }

    public virtual Partner PartnerNavigation { get; set; } = null!;

    public virtual Product ProductNavigation { get; set; } = null!;
}
