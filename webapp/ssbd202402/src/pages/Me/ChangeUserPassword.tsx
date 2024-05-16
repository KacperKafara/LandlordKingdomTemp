import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
  AlertDialogTrigger,
} from "@/components/ui/alert-dialog";
import { Button } from "@/components/ui/button";
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";
import { Input } from "@/components/ui/input";
import { useToast } from "@/components/ui/use-toast";
import { useChangeUserPassword } from "@/data/useChangeUserPassword";
import { zodResolver } from "@hookform/resolvers/zod";
import { AxiosError } from "axios";
import { TFunction } from "i18next";
import { FC } from "react";
import { useForm } from "react-hook-form";
import { useTranslation } from "react-i18next";
import { z } from "zod";

const passwordChangeSchema = (t: TFunction) =>
  z
    .object({
      oldPassword: z.string().min(8, t("registerPage.passwordRequired")),
      newPassword: z.string().min(8, t("registerPage.passwordRequired")),
      confirmPassword: z.string().min(8, t("registerPage.passwordMatch")),
    })
    .refine((data) => data.newPassword === data.confirmPassword, {
      message: t("registerPage.passwordMatch"),
      path: ["confirmPassword"],
    });

type PasswordChangeSchema = z.infer<ReturnType<typeof passwordChangeSchema>>;

const ChangeUserPassword: FC = () => {
  const { toast } = useToast();
  const { t } = useTranslation();
  const { changePassword } = useChangeUserPassword();
  const passwordChangeForm = useForm<PasswordChangeSchema>({
    resolver: zodResolver(passwordChangeSchema(t)),
    values: {
      oldPassword: "",
      newPassword: "",
      confirmPassword: "",
    },
  });
  const handlePasswordChangeSubmit = passwordChangeForm.handleSubmit(
    async (values) => {
      try {
        await changePassword({
          oldPassword: values.oldPassword,
          newPassword: values.newPassword,
        });
        toast({
          title: t("changePasswordForm.success"),
        });
        passwordChangeForm.reset();
      } catch (error) {
        const errorResponse = error as AxiosError;
        if (errorResponse.response?.status === 404) {
          toast({
            variant: "destructive",
            title: t("changePasswordForm.errorTitle"),
            description: t("changePasswordForm.errorDescriptionNotFound"),
          });
        } else if (errorResponse.response?.status === 400) {
          toast({
            variant: "destructive",
            title: t("changePasswordForm.errorTitle"),
            description: t("changePasswordForm.errorDescriptionBadRequest"),
          });
        } else {
          toast({
            variant: "destructive",
            title: t("changePasswordForm.errorTitle"),
          });
        }
      }
    }
  );
  return (
    <Form {...passwordChangeForm}>
      <form
        onSubmit={handlePasswordChangeSubmit}
        className="flex flex-col gap-3 w-2/4"
      >
        <FormField
          control={passwordChangeForm.control}
          name="oldPassword"
          render={({ field }) => (
            <FormItem>
              <FormLabel>{t("changePasswordForm.oldPassword")}</FormLabel>
              <FormControl>
                <Input
                  {...field}
                  type="password"
                  autoComplete="current-password"
                />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <FormField
          control={passwordChangeForm.control}
          name="newPassword"
          render={({ field }) => (
            <FormItem>
              <FormLabel>{t("changePasswordForm.newPassword")}</FormLabel>
              <FormControl>
                <Input {...field} type="password" autoComplete="new-password" />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <FormField
          control={passwordChangeForm.control}
          name="confirmPassword"
          render={({ field }) => (
            <FormItem>
              <FormLabel>{t("changePasswordForm.confirmPassword")}</FormLabel>
              <FormControl>
                <Input {...field} type="password" autoComplete="new-password" />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <AlertDialog>
          <AlertDialogTrigger asChild>
            <Button className="self-end mt-5">
              {t("changePasswordForm.submit")}
            </Button>
          </AlertDialogTrigger>
          <AlertDialogContent>
            <AlertDialogHeader>
              <AlertDialogTitle>
                {t("changePasswordForm.alertDialogTitle")}
              </AlertDialogTitle>
              <AlertDialogDescription>
                {t("changePasswordForm.alertDialogDescription")}
              </AlertDialogDescription>
            </AlertDialogHeader>
            <AlertDialogFooter>
              <AlertDialogCancel>{t("cancel")}</AlertDialogCancel>
              <AlertDialogAction asChild>
                <Button
                  type="submit"
                  onClick={() => handlePasswordChangeSubmit()}
                >
                  {t("confirm")}
                </Button>
              </AlertDialogAction>
            </AlertDialogFooter>
          </AlertDialogContent>
        </AlertDialog>
      </form>
    </Form>
  );
};

export default ChangeUserPassword;