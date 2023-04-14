namespace Entities.Dtos
{
    public class TDBCostListCategoriesDto
    {
        public long Id { get; set; }
        public string Treatment { get; set; }
        public decimal Price { get; set; }
        public int Vat { get; set; }
        public decimal PriceWithVat { get; set; }
        public int TDBCostNameCategories_Id_Fk { get; set; }
        public string TDBCategoryName { get; set; }
    }
}
