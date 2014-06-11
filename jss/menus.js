/*
 * Ext JS Library 2.1
 *
 */
var userName = document.getElementById('tmp_usrName').value;


Ext.onReady(function(){
    Ext.QuickTips.init();

	// for toolTip
	Ext.menu.BaseItem.prototype.onRender = function(container){
		this.el = Ext.get(this.el);
		container.dom.appendChild(this.el.dom);
		if (this.tooltip) {
		this.el.dom.qtip = this.tooltip;
		}
	};
	
	// end Here


    // Menus can be prebuilt and passed by reference
    var menuHome = new Ext.menu.Menu({
        id: 'menuHome',
         items: [
			{
                text: 'Můj profil',
				tooltip:'Můj profil',
				 handler: editUserProfile
			},
			{
                text: 'Změna hesla',
				tooltip:'Změna hesla',
			    href :'ChangePassword.do?operation=edit&pageOf=pageOfChangePassword'
            }
        ]
    });

    var menu = new Ext.menu.Menu({
        id: 'mainMenu',
        items: [
            {
                text: 'Uživatel',
				href:'User.do?operation=add&pageOf=pageOfUserAdmin',
				tooltip:'Přidat uživatele',
                menu: {        // <-- submenu by nested config object
                    items: [
                        // stick any markup in a menu
                       {
                            text: 'Přidat',
							href:'User.do?operation=add&pageOf=pageOfUserAdmin'
                        }, {
                            text: 'Upravit',
                            href:'SimpleQueryInterface.do?pageOf=pageOfUserAdmin&aliasName=User&isForm=true'
                        }, {
                            text: 'Schválit nové uživatele',
                            href:'ApproveUserShow.do?pageNum=1'
	                    }, {
                            text: 'Audit přihlášení',
                            href:'LoginAuditDashboard.do?operation=init&recordPerPage=200000&startIndex=1'
	                       }
                    ]
                }
            },
				{
                text: 'Instituce',
				tooltip:'Přidat instituci',
				href:'Institution.do?operation=add&pageOf=pageOfInstitution',
                menu: {        // <-- submenu by nested config object
                    items: [
                        // stick any markup in a menu
                       {
                            text: 'Přidat',
							href:'Institution.do?operation=add&pageOf=pageOfInstitution'
                        }, {
                            text: 'Upravit',
                            href:'SimpleQueryInterface.do?pageOf=pageOfInstitution&aliasName=Institution&isForm=true'
                        }
                    ]
                }
            },
				{
                text: 'Oddělení',
				tooltip:'Přidat oddělení',
				href:'Department.do?operation=add&pageOf=pageOfDepartment',
                menu: {        // <-- submenu by nested config object
                    items: [
                        // stick any markup in a menu
                       {
                            text: 'Přidat',
							href:'Department.do?operation=add&pageOf=pageOfDepartment'
                        }, {
                            text: 'Upravit',
                            href:'SimpleQueryInterface.do?pageOf=pageOfDepartment&aliasName=Department&isForm=true'
                        }
                    ]
                }
            },
				{
                text: 'Výzkumná skupina',
				tooltip:'Přidat výzkumnou skupinu',
				href:'CancerResearchGroup.do?operation=add&pageOf=pageOfCancerResearchGroup',
                menu: {        // <-- submenu by nested config object
                    items: [
                        // stick any markup in a menu
                       {
                            text: 'Přidat',
							href:'CancerResearchGroup.do?operation=add&pageOf=pageOfCancerResearchGroup'
                        }, {
                            text: 'Upravit',
                            href:'SimpleQueryInterface.do?pageOf=pageOfCancerResearchGroup&aliasName=CancerResearchGroup&isForm=true'
                        }
                    ]
                }
            },

			  {
                text: 'Lokalita',
				tooltip:'Přidat lokalitu',
				href:'Site.do?operation=add&pageOf=pageOfSite',
                menu: {        // <-- submenu by nested config object
                    items: [
                        // stick any markup in a menu
                       {
                            text: 'Přidat',
                            href:'Site.do?operation=add&pageOf=pageOfSite'
                        }, {
                            text: 'Upravit',
                            href:'SimpleQueryInterface.do?pageOf=pageOfSite&aliasName=Site&isForm=true'
                        }
                    ]
                }
            },
			  {
                text: 'Typ uložiště',
				tooltip:'Přidat typ uložiště',
				href:'StorageType.do?operation=add&pageOf=pageOfStorageType',
                menu: {        // <-- submenu by nested config object
                    items: [
                        // stick any markup in a menu
                       {
                            text: 'Přidat',
                             href:'StorageType.do?operation=add&pageOf=pageOfStorageType'
                        }, {
                            text: 'Upravit',
                            href:'SimpleQueryInterface.do?pageOf=pageOfStorageType&aliasName=StorageType'
                        }
                    ]
                }
            },
			{
                text: 'Skladovací kontejner',
				tooltip:'Přidat skladovací kontejner',
				href:'OpenStorageContainer.do?operation=add&pageOf=pageOfStorageContainer',
                menu: {        // <-- submenu by nested config object
                    items: [
                        // stick any markup in a menu
                       {
                            text: 'Přidat',
                            href:'OpenStorageContainer.do?operation=add&pageOf=pageOfStorageContainer'
                        }, {
                            text: 'Upravit',
                             href:'SimpleQueryInterface.do?pageOf=pageOfStorageContainer&aliasName=StorageContainer'
                        }, {
                            text: 'Pohled - mapa',
                             href:'OpenStorageContainer.do?operation=showEditAPageAndMap&pageOf=pageOfStorageContainer'
                        }
                    ]
                }
            },
			{
                text: 'Typ pole vzorků',
				tooltip:'Přidat typ pole vzorků',
				href:'SpecimenArrayType.do?operation=add&amp;pageOf=pageOfSpecimenArrayType',
                menu: {        // <-- submenu by nested config object
                    items: [
                        // stick any markup in a menu
                       {
                            text: 'Přidat',
                            href:'SpecimenArrayType.do?operation=add&amp;pageOf=pageOfSpecimenArrayType'
                        }, {
                            text: 'Upravit',
                            href:'SimpleQueryInterface.do?pageOf=pageOfSpecimenArrayType&aliasName=SpecimenArrayType'
                        }
                    ]
                }
            },
			{
                text: 'Biologické nebezpečí',
				tooltip:'Přidat Biologické nebezpečí',
				href:'Biohazard.do?operation=add&pageOf=pageOfBioHazard',
                menu: {        // <-- submenu by nested config object
                    items: [
                        // stick any markup in a menu
                       {
                            text: 'Přidat',
                            href:'Biohazard.do?operation=add&pageOf=pageOfBioHazard'
                        }, {
                            text: 'Upravit',
                            href:'SimpleQueryInterface.do?pageOf=pageOfBioHazard&aliasName=Biohazard&isForm=true'
                        }
                    ]
                }
            },
			{
                text: 'Protokol sběru',
				tooltip:'Přidat Protokol sběru',
//				href:'CollectionProtocol.do?operation=add&pageOf=pageOfCollectionProtocol',
					                href:'OpenCollectionProtocol.do?pageOf=pageOfmainCP&operation=add',
                menu: {        // <-- submenu by nested config object
                    items: [
                        // stick any markup in a menu
                       {
                            text: 'Přidat',
                            href:'OpenCollectionProtocol.do?pageOf=pageOfmainCP&operation=add'
                        }, {
                            text: 'Upravit',
                            href:'SimpleQueryInterface.do?pageOf=pageOfCollectionProtocol&aliasName=CollectionProtocol'
                        }
                    ]
                }
            },
			{
                text: 'Distribuční protokol',
				tooltip:'Přidat Distribuční protokol',
				href:'DistributionProtocol.do?operation=add&pageOf=pageOfDistributionProtocol',
                menu: {        // <-- submenu by nested config object
                    items: [
                        // stick any markup in a menu
                       {
                            text: 'Přidat',
                            href:'DistributionProtocol.do?operation=add&pageOf=pageOfDistributionProtocol'
                        }, {
                            text: 'Upravit',
                            href:'SimpleQueryInterface.do?pageOf=pageOfDistributionProtocol&aliasName=DistributionProtocol'
                        }
                    ]
                }
            },
			{
                text: 'Lokální rozšíření',
				tooltip:'Zobrazit lokální rozšíření',
                href:'DefineAnnotationsInformationPage.do?operation=add',
                menu: {        // <-- submenu by nested config object
                    items: [
                        // stick any markup in a menu
                        {
                            text: 'Přidat',
                            href:'DefineAnnotationsInformationPage.do?operation=add'
                        }, {
                            text: 'Upravit',
                            href:'DefineAnnotationsInformationPage.do?operation=edit'
                        }
                    ]
                }
            },
            {
                text: 'Hlášené problémy',
				tooltip:'Ukázat hlášené problémy',
                href:'ReportedProblemShow.do?pageNum=1'
            },
			{
                text: 'Konfliktní CHPRs',
				tooltip:'Zobrazit konfliktní Chirurgicko-patologické reporty',
                href:'ConflictView.do?pageNum=1'
            }
		]
    });
    
    
			// Add this item to menu if EMPI is enabled	
			if(empiEnabled=='true')
			{
				var boItem=new Ext.menu.Item({
							text: 'Hromadné EMPI operace',
							tooltip:'Hromadné EMPI operace',
							href:'BulkEmpiGeneration.do?'
						});
			
				var item = menu.add(boItem);
			}			
			
			
            // For Bio Specimen Data

    var menu_bio = new Ext.menu.Menu({
        id: 'menu_bio',
        items: [
            {
                text: 'Pohled na základě Protokolu sběru',
				tooltip:'Pohled na základě Protokolu sběru',
                href:'CpBasedSearch.do'

            },

              {
                text: 'Vzorek',
				tooltip:'Úprava vzorku',
				href:'SimpleQueryInterface.do?pageOf=pageOfNewSpecimen&aliasName=Specimen',
                menu: {        // <-- submenu by nested config object
                    items: [
                        // stick any markup in a menu
                        {
                            text: 'Upravit',
                            href:'SimpleQueryInterface.do?pageOf=pageOfNewSpecimen&aliasName=Specimen'
                        }, {
                            text: 'Odvodit',
                            href:'CreateSpecimen.do?operation=add&pageOf=pageOfDeriveSpecimen&virtualLocated=true'
                        }, {
                            text: 'Alikvóty',
                            href:'GetAliquotDetails.do?pageOf=fromMenu&parentSpecimentLabel=&aliquotCount=&quantityPerAliquot=&searchBasedOn=label'
                        }, {
                            text: 'Události',
                            href:'QuickEvents.do?operation=add'
                        }, {
                            text: 'Hromadná tvorba',
                             href:'MultipleSpecimenFlexInitAction.do?pageOf=pageOfMultipleSpWithMenu'
                        }
                    ]
                }
            },
            {
                text: 'Pole vzorků',
				tooltip:'Přidat pole vzorků',
				href:'SpecimenArray.do?operation=add&amp;pageOf=pageOfSpecimenArray',
                menu: {        // <-- submenu by nested config object
                    items: [
                        // stick any markup in a menu
                       {
                            text: 'Přidat',
                            href:'SpecimenArray.do?operation=add&amp;pageOf=pageOfSpecimenArray'
                        }, {
                            text: 'Upravit',
                             href:'SimpleQueryInterface.do?pageOf=pageOfSpecimenArray&aliasName=SpecimenArray'
                        }, {
                            text: 'Alikvóty',
                            href:'SpecimenArrayAliquots.do?pageOf=pageOfSpecimenArrayAliquot'
                        }
                    ]
                }
            },
			  {
                text: 'Distribuce',
				tooltip:'Report o distribuci vzorku',
				href:'SimpleQueryInterface.do?pageOf=pageOfDistribution&aliasName=Distribution',
                menu: {        // <-- submenu by nested config object
                    items: [
                        // stick any markup in a menu
                        {
                            text: 'Report pole',
                            tooltip:'Report o distribuci pole',
                            href:'SimpleQueryInterface.do?pageOf=pageOfArrayDistribution&aliasName=Distribution_array'
                        }
                    ]
                }
            },

                                      {

                            text: 'Zobrazení objednávky',
							tooltip:'Zobrazení objednávky',
		                    href:'RequestListView.do?pageNum=1'

            },
            {
                text: 'Přeprava a sledování',
				tooltip:'Přehled - Přeprava a sledování',
				href : 'ShowDashboardAction.do'
            }
        ]
    });
    
	
    if(empiEnabled=='true')
    {
    	var processMessageItem=new Ext.menu.Item({
							text: 'Process Messages',
							tooltip:'Process Messages',
							href:'ProcessMatchedParticipants.do?pageOf=pageOfMatchedParticipant&identifierFieldIndex=0',
							menu: {        // <-- submenu by nested config object
								items: [
									// stick any markup in a menu
								   {
										text: 'Registration',
										href:'ProcessMatchedParticipants.do?pageOf=pageOfMatchedParticipant&identifierFieldIndex=0'
								   }
								]
							}
						});
		var item = menu_bio.add(processMessageItem);
    }
            // For Search link

    var menu_search = new Ext.menu.Menu({
        id: 'menu_search',
        items: [
			{
                text: 'Uložené dotazy',
				tooltip:'Uložené dotazy',
			    href : 'ShowQueryDashboardAction.do'
            },
			{
                text: 'Jednoduché',
				tooltip:'Jednoduché hledání',
			    href : 'SimpleQueryInterface.do?pageOf=pageOfSimpleQueryInterface'
            },
			{
                text: 'Pokročilé',
				tooltip:'Pokročilé hledání',
			    href : 'QueryWizard.do?'
            },
            {
                text: 'Můj seznam',
				tooltip:'Můj seznam hledání',
                href:'ViewCart.do?operation=view'
            },
            {
                text: 'Zobrazení seznamu vzorků',
				tooltip:'Specimen List View',
                href:'ViewSpecimenList.do?operation=view'
            }
        ]
    });

	    var logout_menu = new Ext.menu.Menu({
        id: 'logout_menu',
		items: [
			{
                text: 'Můj profil',
				tooltip:'Můj profil',
				 handler: editUserProfile
			},
			{
                text: 'Změna hesla',
				tooltip:'Změna hesla',
			    href :'ChangePassword.do?operation=edit&pageOf=pageOfChangePassword'
            },
			{
				text: 'Nápověda',
				href:'/catissuecore/RedirectToHelp.do',
				tooltip:'Nápověda'
			},
			{
				text: 'Uživatelská příručka',
				href: '#',
				handler: getUserGuideLink,
				tooltip: 'Uživatelská příručka'
			},
			{
				text: 'UML Model',
				href:'#',
				handler: getUmlModelLink,
				tooltip:'UML Model'
			},
			
			{
				text: 'Nahlásit problém',
				href:'ReportProblem.do?operation=add', 
				tooltip:'Nahlásit problém'
			},
			
			{
				text: 'Souhrn dat',
				href:'Summary.do', 
				tooltip:'Souhrn dat'
			},
			
			{
				text: 'Odhlásit',
				href:'/catissuecore/Logout.do', 
				tooltip:'Odhlásit'
			}
		]
    });

	
	
	
	

	//For Help Tab

	var helpMenu = new Ext.menu.Menu({
        id: 'helpMenu',
         items: [
			{
				text: 'Nápověda',
				href:'/catissuecore/RedirectToHelp.do',
				tooltip:'Nápověda'
			},
			{
				text: 'Uživatelská příručka',
				href: '#',
				handler: getUserGuideLink,
				tooltip: 'Uživatelská příručka'
			},
			{
				text: 'UML Model',
				href:'#',
				handler: getUmlModelLink,
				tooltip:'UML Model'
			}
        ]
    });

    var tb = new Ext.Toolbar();
    tb.render('toolbarLoggedIn');

		tb.add(
		{
			text:'Administrace',
            menu: menu 
		},

        {
            text:'Biobanking',
            menu: menu_bio  // assign menu by instance
        },
		{
       		text: 'Vyhledávání',
            menu: menu_search  // assign menu by instance
        },
		
		{	
			text: document.getElementById('tmp_usrName').value,
			menu: logout_menu
		},
		
		{	
			text: '<img src="images/help.png"/>',
			href:'#',
			handler: getHelpURL
			//tooltip:'help'
		}
		);

    // functions to display feedback


    function onItemCheck(){
		alert("This Page is under construction");
      //  Ext.example.msg('Item Check', 'You {1} the "{0}" menu item.', item.text, checked ? 'checked' : 'unchecked');
    }
	function handleMenu(item)
	{
	document.location.href = item.link;
	}

});
