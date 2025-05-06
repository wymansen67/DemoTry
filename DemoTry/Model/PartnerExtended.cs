using System.ComponentModel;

namespace DemoTry.Model
{
    public class PartnerExtended : Partner
    {
        public int Discount { get; set; }

        /// <summary>
        /// Класс расширение партнёра добавляющий скидку
        /// </summary>
        public PartnerExtended(Partner p, int d)
        {
            Type = p.Type;
            Name = p.Name;
            DirectorLastname = p.DirectorLastname;
            DirectorFirstname = p.DirectorFirstname;
            DirectorMiddlename = p.DirectorMiddlename;
            Email = p.Email;
            Phone = p.Phone;
            Index = p.Index;
            Area = p.Area;
            City = p.City;
            Street = p.Street;
            Building = p.Building;
            Tin = p.Tin;
            Rating = Math.Round(p.Rating, 2);
            TypeNavigation = p.TypeNavigation;
            Discount = d;
        }
    }
}