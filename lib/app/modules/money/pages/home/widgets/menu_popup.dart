enum MenuPopup {
  FILTRO, EDITAR, FIXOS, PREVISTOS
}

Map<MenuPopup, String> enumToMenuItem = {
  MenuPopup.FILTRO: 'Filtrar',
  MenuPopup.EDITAR: 'Editar Orçamento',
  MenuPopup.FIXOS: 'Fixos Gerais',
  MenuPopup.PREVISTOS: 'Previsto Gerais',
};

Map<String, MenuPopup> menuItemsToEnum = {
  'Filtrar': MenuPopup.FILTRO,
  'Editar Orçamento': MenuPopup.EDITAR,
  'Fixos Gerais': MenuPopup.FIXOS,
  'Previsto Gerais': MenuPopup.PREVISTOS,
};