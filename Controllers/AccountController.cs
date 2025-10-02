using Microsoft.AspNetCore.Mvc;
using RegistrationFormApp.Models;

namespace RegistrationFormApp.Controllers
{
    public class AccountController : Controller
    {
        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Register(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                TempData["Success"] = $"User {model.Name} registered successfully!";
                return RedirectToAction("Register");
            }
            return View(model);
        }
    }
}
