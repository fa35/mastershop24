<?php

class body {
    public function body(){
    }
    public function createbody() {
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
                  <th>Header</th>
                  <th>Header</th>
                  <th>Header</th>
                  <th>Header</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1,001</td>
                  <td>Lorem</td>
                  <td>ipsum</td>
                  <td>dolor</td>
                  <td>sit</td>
                </tr>
                <tr>
                  <td>1,002</td>
                  <td>amet</td>
                  <td>consectetur</td>
                  <td>adipiscing</td>
                  <td>elit</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      ';
    }
}
