using System.Collections.Generic;
using System.Linq;
using System.Windows;
using RealEstate.Common;
using RealEstate.Common.Cultures;
using RealEstate.Common.Enumerations;
using RealEstate.DataAccess;
using UserControls;

namespace RealEstateApp
{
	/// <summary>
	/// Interaction logic for EditUserForm.xaml
	/// </summary>
	public partial class EditUserForm : Window
	{
		public class ExistingRegions : BindableObject
		{
			private Region _region;
			public Region Region
			{
				get { return _region; }
				set
				{
					if (_region == value) return;
					_region = value;
					OnPropertyChanged("Region");
				}
			}

			private bool _isSelected;
			public bool IsSelected
			{
				get { return _isSelected; }
				set
				{
					if (_isSelected == value) return;
					_isSelected = value;
					OnPropertyChanged("IsSelected");
				}
			}
		}

		public class ExistingOrderType : BindableObject
		{
			private OrderType _orderType;
			public OrderType OrderType
			{
				get { return _orderType; }
				set
				{
					if (_orderType == value) return;
					_orderType = value;
					OnPropertyChanged("OrderType");
				}
			}

			private bool _isSelected;
			public bool IsSelected
			{
				get { return _isSelected; }
				set
				{
					if (_isSelected == value) return;
					_isSelected = value;
					OnPropertyChanged("IsSelected");
				}
			}
		}

		public class ExistingEstateType : BindableObject
		{
			private EstateType _estateType;

			public EstateType EstateType
			{
				get { return _estateType; }
				set
				{
					if (_estateType == value) return;
					_estateType = value;
					OnPropertyChanged("EstateType");
				}
			}

			private bool _isSelected;
			public bool IsSelected
			{
				get { return _isSelected; }
				set
				{
					if (_isSelected == value) return;
					_isSelected = value;
					OnPropertyChanged("IsSelected");
				}
			}
		}

		public class ExistingState : BindableObject
		{
			private State _state;
			public State State
			{
				get { return _state; }
				set
				{
					if (_state == value) return;
					_state = value;
					OnPropertyChanged("State");
				}
			}

			private bool _isSelected;
			public bool IsSelected
			{
				get { return _isSelected; }
				set
				{
					if (_isSelected == value) return;
					_isSelected = value;
					OnPropertyChanged("IsSelected");
				}
			}
		}



		public List<ExistingState> States
		{
			get { return (List<ExistingState>)GetValue(StatesProperty); }
			set { SetValue(StatesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for States.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty StatesProperty =
			DependencyProperty.Register("States", typeof(List<ExistingState>), typeof(EditUserForm), new UIPropertyMetadata(null, OnStatesChanged));

		private static void OnStatesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			EditUserForm form = d as EditUserForm;
			if (form != null)
			{
				form.States = (List<ExistingState>)e.NewValue;
			}
		}


		public List<ExistingEstateType> EstateTypes
		{
			get { return (List<ExistingEstateType>)GetValue(EstateTypesProperty); }
			set { SetValue(EstateTypesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for EstateTypes.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty EstateTypesProperty =
			DependencyProperty.Register("EstateTypes", typeof(List<ExistingEstateType>), typeof(EditUserForm), new UIPropertyMetadata(null, OnEstateTypesChanged));

		private static void OnEstateTypesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			EditUserForm form = d as EditUserForm;
			if (form != null)
			{
				form.EstateTypes = (List<ExistingEstateType>)e.NewValue;
			}
		}

		public List<ExistingOrderType> OrderTypes
		{
			get { return (List<ExistingOrderType>)GetValue(OrderTypesProperty); }
			set { SetValue(OrderTypesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for OrderTypes.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty OrderTypesProperty =
			DependencyProperty.Register("OrderTypes", typeof(List<ExistingOrderType>), typeof(EditUserForm), new UIPropertyMetadata(null, OnOrderTypesChanged));

		private static void OnOrderTypesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			EditUserForm form = d as EditUserForm;
			if (form != null)
			{
				form.OrderTypes = (List<ExistingOrderType>)e.NewValue;
			}
		}


		public List<ExistingRegions> Regions
		{
			get { return (List<ExistingRegions>)GetValue(RegionsProperty); }
			set { SetValue(RegionsProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Regions.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty RegionsProperty =
			DependencyProperty.Register("Regions", typeof(List<ExistingRegions>), typeof(EditUserForm), new UIPropertyMetadata(null, OnRegionsChanged));

		private static void OnRegionsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			EditUserForm form = d as EditUserForm;
			if (form != null)
			{
				form.Regions = (List<ExistingRegions>)e.NewValue;
			}
		}


		public List<Role> Roles
		{
			get { return (List<Role>)GetValue(RolesProperty); }
			set { SetValue(RolesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Roles.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty RolesProperty =
			DependencyProperty.Register("Roles", typeof(List<Role>), typeof(EditUserForm), new UIPropertyMetadata(null, OnRolesChanged));

		private static void OnRolesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			EditUserForm form = sender as EditUserForm;
			if (form != null)
			{
				form.Roles = (List<Role>)e.NewValue;
			}
		}

		public User EditUser
		{
			get { return (User)GetValue(EditUserProperty); }
			set { SetValue(EditUserProperty, value); }
		}

		// Using a DependencyProperty as the backing store for EditUser.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty EditUserProperty =
			DependencyProperty.Register("EditUser", typeof(User), typeof(EditUserForm), new UIPropertyMetadata(null, OnEditUserChanged));

		private static void OnEditUserChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			EditUserForm form = sender as EditUserForm;
			if (form != null)
			{
				form.EditUser = (User)e.NewValue;
				form.txtPassword.Password = form.EditUser.Password;
				form.txtPassword.ToolTip = form.EditUser.Password;
				form.CreateBrokerRegions();
				form.CreateBrokerOrderTypes();
				form.CreateBrokerEstateTypes();
				form.CreateBrokerStates();
			}
		}

		public EditUserForm(User user)
			: this()
		{
			EditUser = user ?? new User();
		}

		public EditUserForm()
		{
			InitializeComponent();
			Roles = Session.Inst.BEManager.GetRoles();
			if(!Session.Inst.User.IsDirector)
			{
				Roles.Remove(Roles.First(s => s.ID == (int) RealEstate.DataAccess.Roles.Director));
			}
			if (EditUser == null)
			{
				EditUser = new User();
			}
		}

		private void CreateBrokerStates()
		{
			States = new List<ExistingState>();
			var states = Session.Inst.BEManager.GetStates(Session.Inst.User, Session.Inst.OfflineMode).Where(s => s.ID != 1);  //!Yerevan
			foreach (var state in states)
			{
				States.Add(new ExistingState { State = state });
			}

			if (EditUser != null)
			{
				if (EditUser.ID <= 0) return;

				foreach (ExistingState state in States)
				{
					state.IsSelected = EditUser.BrokerStates.FirstOrDefault(s => s.StateID == state.State.ID) != null;
				}
			}
		}

		private void CreateBrokerRegions()
		{
			Regions = new List<ExistingRegions>();
			var yerevanRegions = Session.Inst.BEManager.GetRegions(1, Session.Inst.User, Session.Inst.OfflineMode);
			foreach (Region region in yerevanRegions)
			{
				Regions.Add(new ExistingRegions { Region = region });
			}

			if (EditUser != null)
			{
				if (EditUser.ID <= 0) return;

				foreach (ExistingRegions region in Regions)
				{
					region.IsSelected = EditUser.BrokersRegions.FirstOrDefault(s => s.RegionID == region.Region.RegionID) != null;
				}
			}
		}

		private void CreateBrokerOrderTypes()
		{
			OrderTypes = new List<ExistingOrderType>();
			var orders = Session.Inst.BEManager.GetOrderTypesForEstate(Session.Inst.User, Session.Inst.OfflineMode);
			foreach (var order in orders)
			{
				OrderTypes.Add(new ExistingOrderType { OrderType = order });
			}

			if (EditUser != null)
			{
				if (EditUser.ID <= 0) return;

				foreach (ExistingOrderType ordertype in OrderTypes)
				{
					ordertype.IsSelected = EditUser.BrokerOrderTypes.FirstOrDefault(s => s.OrderTypeID == ordertype.OrderType.OrderTypeID) != null;
				}
			}
		}

		private void CreateBrokerEstateTypes()
		{
			EstateTypes = new List<ExistingEstateType>();
			var types = Session.Inst.BEManager.GetEstateTypes(Session.Inst.User, Session.Inst.OfflineMode);
			foreach (var estateType in types)
			{
				EstateTypes.Add(new ExistingEstateType { EstateType = estateType });
			}

			if (EditUser != null)
			{
				if (EditUser.ID <= 0) return;

				foreach (var estateType in EstateTypes)
				{
					estateType.IsSelected = EditUser.BrokerEstateTypes.FirstOrDefault(s => s.EstateTypeID == estateType.EstateType.EstateTypeID) != null;
				}
			}
		}

		private void btnOK_Click(object sender, RoutedEventArgs e)
		{
			if (!ValidateUser())
			{
				return;
			}

			EditUser.UserName = EditUser.UserName.ToLower();
			UpdateUserRegions();
			UpdateUserEstateTypes();
			UpdateUserOrderTypes();
			UpdateUserStates();
			if (EditUser.ID > 0)
			{
				if (txtPassword.Password != EditUser.Password)
				{
					EditUser.Password = txtPassword.Password;
				}
				if (Session.Inst.BEManager.UpdateUser(EditUser))
				{
					//MessageBox.Show("User updated successfully");
					MessageBox.Show(CultureResources.Inst["DataSavedSuccessfully"], "", MessageBoxButton.OK, MessageBoxImage.Information);
					DialogResult = true;
					if (Session.Inst.User.ID == EditUser.ID)
					{
						Session.Inst.User = EditUser;
					}
					Close();
				}
				else
				{
					MessageBox.Show(CultureResources.Inst["UserDataNotSaved"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
				}
			}
			else
			{
				EditUser.Password = txtPassword.Password;
				if (Session.Inst.BEManager.AddUser(EditUser))
				{
					MessageBox.Show(CultureResources.Inst["DataSavedSuccessfully"], "", MessageBoxButton.OK, MessageBoxImage.Information);
					DialogResult = true;
					if (Session.Inst.User.ID == EditUser.ID)
					{
						Session.Inst.User = EditUser;
					}
					Close();
				}
				else
				{
					MessageBox.Show(CultureResources.Inst["UserDataNotSaved"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
				}
			}
		}

		private bool ValidateUser()
		{
			if (string.IsNullOrEmpty(EditUser.UserName))
			{
				MessageBox.Show(CultureResources.Inst["PleaseInputUsername"], CultureResources.Inst["InputUsername"], MessageBoxButton.OK, MessageBoxImage.Warning);
				txtUserName.Focus();
				return false;
			}
			if (EditUser.ID == 0 && !Session.Inst.BEManager.ValidateUser(txtUserName.Text))
			{
				MessageBox.Show(CultureResources.Inst["UserNameExist"], CultureResources.Inst["InputUsername"], MessageBoxButton.OK, MessageBoxImage.Warning);
				txtUserName.Focus();
				return false;
			}
			if (string.IsNullOrEmpty(txtPassword.Password))
			{
				MessageBox.Show(CultureResources.Inst["PleaseInputPassword"], CultureResources.Inst["InputPassword"], MessageBoxButton.OK, MessageBoxImage.Warning);
				txtPassword.Focus();
				return false;
			}
			if (EditUser.RoleID.GetValueOrDefault(0) == 0)
			{
				MessageBox.Show(CultureResources.Inst["PleaseSelectUserType"], CultureResources.Inst["UserType"], MessageBoxButton.OK, MessageBoxImage.Warning);
				cbRoles.Focus();
				return false;
			}
			return true;
		}

		private void UpdateUserStates()
		{
			EditUser.BrokerStates.Clear();
			var selectedStates = States.Where(s => s.IsSelected);
			foreach (var state in selectedStates)
			{
				EditUser.BrokerStates.Add(new BrokerState { StateID = state.State.ID });
			}
		}

		private void UpdateUserRegions()
		{
			EditUser.BrokersRegions.Clear();
			var selectedRegions = Regions.Where(s => s.IsSelected);
			foreach (ExistingRegions region in selectedRegions)
			{
				EditUser.BrokersRegions.Add(new BrokersRegion { RegionID = region.Region.RegionID });
			}
		}

		private void UpdateUserOrderTypes()
		{
			EditUser.BrokerOrderTypes.Clear();
			var selectedOrderTypes = OrderTypes.Where(s => s.IsSelected);
			foreach (var orderType in selectedOrderTypes)
			{
				EditUser.BrokerOrderTypes.Add(new BrokerOrderType { OrderTypeID = orderType.OrderType.OrderTypeID });
			}
		}

		private void UpdateUserEstateTypes()
		{
			EditUser.BrokerEstateTypes.Clear();
			var selectedEstateTypes = EstateTypes.Where(s => s.IsSelected);
			foreach (var estateType in selectedEstateTypes)
			{
				EditUser.BrokerEstateTypes.Add(new BrokerEstateType { EstateTypeID = estateType.EstateType.EstateTypeID });
			}
		}

		private void btnCancel_Click(object sender, RoutedEventArgs e)
		{
			DialogResult = false;
			Close();
		}

		private void chkStatesAll_Checked(object sender, RoutedEventArgs e)
		{
			if (States == null) return;

			foreach (ExistingState state in States)
			{
				state.IsSelected = chkStatesAll.IsChecked ?? false;
			}
		}

		private void chkRegionsAll_Checked(object sender, RoutedEventArgs e)
		{
			if (Regions == null) return;
			foreach (ExistingRegions region in Regions)
			{
				region.IsSelected = chkRegionsAll.IsChecked ?? false;
			}
		}

		private void chkOrderTypesAll_Checked(object sender, RoutedEventArgs e)
		{
			if (OrderTypes == null) return;
			foreach (ExistingOrderType orderType in OrderTypes)
			{
				orderType.IsSelected = chkOrderTypesAll.IsChecked ?? false;
			}
		}

		private void chkEstateTypesAll_Checked(object sender, RoutedEventArgs e)
		{
			if (EstateTypes == null) return;
			foreach (ExistingEstateType estateType in EstateTypes)
			{
				estateType.IsSelected = chkEstateTypesAll.IsChecked ?? false;
			}
		}
	}
}
