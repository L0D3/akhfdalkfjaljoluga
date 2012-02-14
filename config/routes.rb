PatverV1::Application.routes.draw do 
  resources :petty_patents do
    collection do
      get :pdf_table
  end 
  end 

  root :to => 'patents#index'
  resources :patent_protocols do
    collection do
      get :pdf_table
    end
  end
  resources :bills do
    collection do
     get :pdf_rechnung
      get :pdf_bill_tabelle
    end
  end
  resources :fees
  resources :petty_patent_fees
  resources :users do
    collection do
      get :edit_individually
      put :update_individually
    end
  end
  resources :patents do
    collection do
      get :pdf_anfrage_eu
      get :pdf_anfrage_de
      get :pdf_erinnerung1_de
      get :pdf_erinnerung1_eu
      get :pdf_erinnerung2_de
      get :pdf_erinnerung2_eu
      get :pdf_rechnung_de
      get :pdf_rechnung_eu
      get :pdf_table
      get :editsubmissions
      put :updatesubmissions
    end
  end
end
