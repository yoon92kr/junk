import axios from "axios";
import cheerio from "cheerio";

function checkProducts(id, url) {
  return axios.get(url).then(({ data }) => {
    let $ = cheerio.load(data);
    let $prodName = $("div.prod-buy-header h2").text();
    let $salePrice = $("div.prod-sale-price span.total-price")
      .text()
      .replace(/[^0-9]/g, "");
    let $outOfStock = $("div.oos-label").text().trim();

    return {
      id: id,
      title: $prodName,
      salePrice: $salePrice,
      outOfStock: $outOfStock,
    };
  });
}

export { checkProducts };
