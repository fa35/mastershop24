<?php

class body {
    public function body(){
    }
    public function createbody() {
		global $db;
        global $doc;
        $doc .= '<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">MasterShop24</h1>

          <div class="row placeholders">

              <h4>Hauptkategorie / Unterkategorie oder Suchbegriff</h4>
              <span class="text-muted">Hauptkategorie / Unterkategorie</span>

          </div>

          <h2 class="sub-header">Section title</h2>

          <div class="table-responsive">
            <table class="table table-striped table-borderd">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Titel</th>
                  <th>Untergruppe</th>
                  <th>Preis</th>
                  <th>Header</th>
                </tr>
              </thead>
              <tbody>';
              $sqlQuery = 'SELECT * FROM Artikel';
              $articlelist = $db->getQueryResults($sqlQuery);
              foreach ($articlelist as $article){
				  $articleID = $article['idArtikel'];
				  $price = $article['NettoPreis'];
				  $subgroup = $article['idUntergruppe'];
				  $title = $article['Titel'];
                  $doc .= "<tr>
                  <td>$articleID</td>
                  <td>$title</td>
                  <td>$subgroup</td>
                  <td>$price</td>
                </tr>";
			}
              $doc .= '              </tbody>
            </table>
          </div>
        </div>';
    }
}
