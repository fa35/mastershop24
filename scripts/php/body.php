<?php

class body {
    public function body(){
    }
    public function createbody() {
		global $db;
        global $doc;
        global $params;
        $category = $params['category'];
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
              if ($category) {
	              $sqlQuery = "SELECT * FROM Artikel as a
                               INNER JOIN Untergruppe as u
                               ON a.fidUntergruppe = u.idUntergruppe
                               WHERE fidHauptgruppe = $category";
			} else {
				$sqlQuery = "SELECT * FROM Artikel";
			}

              $articlelist = $db->getQueryResults($sqlQuery);
              foreach ($articlelist as $article){
				  $articleID = $article['idArtikel'];
				  $price = $article['NettoPreis'];
				  $subgroupID = $article['fidUntergruppe'];
				  $subgroupQuery = "SELECT Titel FROM Untergruppe WHERE idUntergruppe=$subgroupID";
				  $subgroupQResult = $db->getQueryResults($subgroupQuery);
				  $subgroup = $subgroupQResult[0]['Titel'];
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
