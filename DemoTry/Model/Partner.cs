using System;
using System.Collections.Generic;

namespace DemoTry.Model;

public partial class Partner
{
    public byte Type { get; set; }

    public string Name { get; set; } = null!;

    public string DirectorLastname { get; set; } = null!;

    public string DirectorFirstname { get; set; } = null!;

    public string DirectorMiddlename { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string Phone { get; set; } = null!;

    public int Index { get; set; }

    public string Area { get; set; } = null!;

    public string City { get; set; } = null!;

    public string Street { get; set; } = null!;

    public string Building { get; set; } = null!;

    public long Tin { get; set; }

    public decimal Rating { get; set; }

    public virtual PartnerType TypeNavigation { get; set; } = null!;
}
